import 'package:doctor_appointment_app/Models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkingHoursWidget extends StatefulWidget {
  WorkingHoursWidget({
    super.key,
    required this.day,
    this.doctorDoc,
  });
  final String day;
  DoctorModel? doctorDoc;

  @override
  State<WorkingHoursWidget> createState() => _WorkingHoursWidgetState();
}

class _WorkingHoursWidgetState extends State<WorkingHoursWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.day,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: widget.doctorDoc != null
                  ? DateFormat('hh:mm a')
                      .format(widget.doctorDoc!.availabilityTimeTo!)
                  : "00:00",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: ' - ',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
                TextSpan(
                    text: widget.doctorDoc != null
                        ? DateFormat('hh:mm a')
                            .format(widget.doctorDoc!.availabilityTimeFrom!)
                        : "00:00",
                    style: TextStyle(
                      fontSize: 14,
                      // color: Colors.black,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
