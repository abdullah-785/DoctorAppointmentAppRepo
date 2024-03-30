import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/hospital_favorite_model.dart';
import 'package:doctor_appointment_app/Models/hospital_model.dart';
import 'package:doctor_appointment_app/view/hospital_details.dart';
import 'package:doctor_appointment_app/view_model/hospital_favorite_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class FavoriteHospitalCard extends StatefulWidget {
  FavoriteHospitalCard({
    Key? key,
    required this.widthParam,
    required this.hospitalFavDoc,
  }) : super(key: key);

  final double widthParam;
  final HospitalFavoriteModel hospitalFavDoc;

  @override
  State<FavoriteHospitalCard> createState() => _FavoriteHospitalCardState();
}

class _FavoriteHospitalCardState extends State<FavoriteHospitalCard> {
  @override
  Widget build(BuildContext context) {
    final hospitalFavModel = Provider.of<HospitalFavoriteViewModel>(context);
    return FutureBuilder<HospitalModel>(
      future: hospitalFavModel.fetchHospitalDetails(widget.hospitalFavDoc),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SpinKitCircle(
            color: Colors.blue,
            size: 30,
          );
        } else if (snapshot.hasError) {
          return Text('Error: Unable to load hospital data');
        } else {
          HospitalModel hospitalModel = snapshot.data!;
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HospitalDetails(
                    hospitalDoc: hospitalModel,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(.4)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: 130,
                          width: widget.widthParam,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            child: Image.network(
                              hospitalModel.image.toString(),
                              // hospitalModel.name.toString()
                              // "https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fmedical-doctor&psig=AOvVaw3tNBbzGILohw-AN_Tj_vzk&ust=1711367563455000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMCE34_rjIUDFQAAAAAdAAAAABAE",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: InkWell(
                                  onTap: () {
                                    // Handle favorite action
                                  },
                                  child: InkWell(
                                    onTap: () {
                                      ///Remove Doc
                                      hospitalFavModel.deleteFavoriteHospital(
                                          widget.hospitalFavDoc);
                                    },
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white.withOpacity(.6),
                                      ),
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 55,
                                  height: 23,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 16,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "4.8",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hospitalModel.name.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 3),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.access_time_filled_outlined,
                                size: 16,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 5),
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
      },
    );
  }
}
