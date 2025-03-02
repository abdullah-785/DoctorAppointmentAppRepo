import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';

class AgoraVideoCalling extends StatefulWidget {
  AgoraVideoCalling(
      {super.key, required this.channelNamee, required this.token});
  String channelNamee;
  String token;

  @override
  State<AgoraVideoCalling> createState() => _AgoraVideoCallingState();
}

class _AgoraVideoCallingState extends State<AgoraVideoCalling> {
  final appId = "3f542839e29845dbadd47606f6c9b82f";
  // // String channelName = channelNamee;
  // final token =
  //     "0063f542839e29845dbadd47606f6c9b82fIAD5Nzr8wtCwbZOwxWi0CLCLlOK/p3PCpuR6OS8TezlVOpN3pHgcOvXLIgAg8Y4UQZFYZgQAAQDRTVdmAgDRTVdmAwDRTVdmBADRTVdm";
  bool isCameraOff = false;
  bool isMuted = false;
  RtcEngine? _engine;
  bool _localUserJoined = false;
  int? _remoteUid;

  @override
  void initState() {
    super.initState();
    initializeAgora();
  }

  Future<void> initializeAgora() async {
    print("Channel name is: " + widget.channelNamee);
    print("Token name is: " + widget.token);
    // Check and request necessary permissions: microphone and camera
    // This is required for mobile apps; permissions are typically managed by the browser for web apps
    if (!kIsWeb) {
      await [Permission.microphone, Permission.camera].request();
    }

    // Create the Agora engine using the App ID provided by Agora.io
    _engine = await RtcEngine.create(appId);

    // Enable the video module
    await _engine!.enableVideo();

    // Setup the video configuration (you can adjust the resolution, frame rate, bitrate, etc. as needed)
    await _engine!.setVideoEncoderConfiguration(VideoEncoderConfiguration(
      frameRate: VideoFrameRate.Fps30,
      orientationMode: VideoOutputOrientationMode.Adaptative,
    ));

    // Define the event handler to handle events such as user joining, user offline, etc.
    _engine!.setEventHandler(RtcEngineEventHandler(
      joinChannelSuccess: (String channel, int uid, int elapsed) {
        print("Local user $uid joined channel: $channel");
        setState(() {
          _localUserJoined = true;
        });
      },
      userJoined: (int uid, int elapsed) {
        print("Remote user $uid joined");
        setState(() {
          _remoteUid = uid;
        });
      },
      userOffline: (int uid, UserOfflineReason reason) {
        print("Remote user $uid left channel");
        setState(() {
          if (_remoteUid == uid) {
            _remoteUid = null;
          }
        });
      },
    ));

    // Join the channel with a token, channel name, and optional additional information (empty string here)
    await _engine!.joinChannel(widget.token, widget.channelNamee, null, 0);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _engine?.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: _remoteVideo(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 100,
              height: 150,
              child: Center(child: RtcLocalView.SurfaceView()),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _toolbar(),
          ),
        ],
      ),
    );
  }

  Widget _toolbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(
          onPressed: _onToggleCamera,
          child: Icon(isCameraOff ? Icons.videocam : Icons.videocam_off),
        ),
        FloatingActionButton(
          onPressed: _onToggleMute,
          child: Icon(isMuted ? Icons.mic_off : Icons.mic),
        ),
        FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: Icon(Icons.call_end),
          backgroundColor: Colors.red,
        ),
      ],
    );
  }

  void _onToggleCamera() {
    setState(() {
      isCameraOff = !isCameraOff;
      _engine?.enableLocalVideo(isCameraOff);
    });
  }

  void _onToggleMute() {
    setState(() {
      isMuted = !isMuted;
      _engine?.muteLocalAudioStream(isMuted);
    });
  }

  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return RtcRemoteView.SurfaceView(
        uid: _remoteUid!,
        channelId: widget.channelNamee,
      );
    } else {
      return Text("Waiting for other participant...");
    }
  }
}
