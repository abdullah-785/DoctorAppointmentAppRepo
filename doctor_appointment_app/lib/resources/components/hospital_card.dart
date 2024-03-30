import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/hospital_model.dart';
import 'package:doctor_appointment_app/view/favorite.dart';
import 'package:doctor_appointment_app/view/hospital_details.dart';
import 'package:doctor_appointment_app/view_model/hospital_favorite_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

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
    final hospitalViewModel = Provider.of<HospitalFavoriteViewModel>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HospitalDetails(
                      hospitalDoc: widget.hospitalModel!,
                    )));
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
                        child: Image.network(
                          widget.hospitalModel!.image.toString(),
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
                        child: InkWell(
                          onTap: () {
                            //here to create favorite Hospital
                          },
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(.6),
                            ),
                            child: StreamBuilder<bool>(
                              stream: hospitalViewModel.CheckLikedOrNot(
                                  widget.hospitalModel!),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return SpinKitThreeBounce(
                                    color: Colors.blue,
                                    size: 10,
                                  );
                                } else if (snapshot.hasError) {
                                  return Text("Error ${snapshot.error}");
                                } else {
                                  return snapshot.data == false
                                      ? InkWell(
                                          onTap: () async {
                                            // favoriteViewModel.doctorLiked(
                                            //   widget.doctorDoc!,
                                            //   context,
                                            // );

                                            hospitalViewModel.hospitalLiked(
                                                widget.hospitalModel!, context);
                                          },
                                          child: Icon(
                                            Icons.favorite_border_rounded,
                                            color: Colors.white,
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    FavoriteScreen(),
                                              ),
                                            );
                                            // favoriteViewModel.deleteFavoriteDoctor(favoriteDoc)
                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.white,
                                          ));
                                }
                              },
                            ),
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
