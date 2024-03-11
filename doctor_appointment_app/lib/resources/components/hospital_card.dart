
import 'package:doctor_appointment_app/Models/hospital_model.dart';
import 'package:doctor_appointment_app/view/hospital_details.dart';
import 'package:flutter/material.dart';

class HospitalCard extends StatefulWidget {
   HospitalCard({
    super.key,
    required this.widthParam,
    this.hospitalModel,
  });
  final double widthParam;
  HospitalModel? hospitalModel;

  @override
  State<HospitalCard> createState() => _HospitalCardState();
}

class _HospitalCardState extends State<HospitalCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HospitalDetails(hospitalDoc: widget.hospitalModel!,)));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Container(
          width: widget.widthParam,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(.4)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Stack(alignment: Alignment.bottomRight, children: [
                Container(
                    // color: Colors.blue,
                    height: 130,
                    width: widget.widthParam,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        child: Image.network(widget.hospitalModel!.image.toString(), 
                        fit: BoxFit.cover,
                        ))),
                Container(
                  height: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SizedBox(
                      //   height: 0,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(.6),
                          ),
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 55,
                          height: 23,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(8),
                                bottomLeft: Radius.circular(12),
                              )),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 16,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "4.8",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
               Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8, top: 5),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.hospitalModel!.name.toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    // Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.access_time_filled_outlined,
                          size: 16,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("15 min - 1.5Km")
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
