import 'package:doctor_appointment_app/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final TextEditingController _newpassword = TextEditingController();
  final TextEditingController _confirmNewPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).width * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    final profileVierModel = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Change Password"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 40,
            // ),
            const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "New Password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                )),
            SizedBox(
              height: 4,
            ),
            Container(
              height: 56,
              child: TextFormField(
                controller: _newpassword,
                obscureText: profileVierModel.isShowNewPass,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 16),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    size: 22,
                  ),
                  suffixIcon: profileVierModel.isShowNewPass == false
                      ? GestureDetector(
                          onTap: () {
                            profileVierModel.setIsShowNewPass(true);
                          },
                          child: Icon(
                            Icons.visibility_rounded,
                            // color: Colors.blue,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            profileVierModel.setIsShowNewPass(false);
                          },
                          child: Icon(Icons.visibility_off)),
                  hintText: "New Passoword",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.black54, width: .4)),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black54, width: .4),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Confirm Password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                )),
            SizedBox(
              height: 4,
            ),
            Container(
              height: 56,
              child: TextFormField(
                controller: _confirmNewPassword,
                obscureText: profileVierModel.isShowConfirmNewPass,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 16),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    size: 22,
                    // color: Colors.blue,
                  ),
                  suffixIcon: profileVierModel.isShowConfirmNewPass == false
                      ? GestureDetector(
                          onTap: () {
                            profileVierModel.setIsShowConNewPass(true);
                          },
                          child: Icon(
                            Icons.visibility_rounded,
                            // color: Colors.blue,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            profileVierModel.setIsShowConNewPass(false);
                          },
                          child: Icon(Icons.visibility_off)),
                  hintText: "Confirm Passoword",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.black54, width: .4)),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black54, width: .4),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: width * 1,
              height: 40,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  onPressed: () async {
                    profileVierModel.updatePassword(
                        _newpassword.text, _confirmNewPassword.text, context);
                  },
                  child: profileVierModel.isNewPasswordUpdated == false
                      ? Text(
                          "Update",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      : SpinKitCircle(
                          color: Colors.white,
                          size: 30,
                        )),
            ),
          ],
        ),
      ),
    );
  }
}
