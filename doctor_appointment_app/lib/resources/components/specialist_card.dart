import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/doctor_favorite.dart';
import 'package:doctor_appointment_app/Models/doctor_model.dart';
import 'package:doctor_appointment_app/utils/utils.dart';
import 'package:doctor_appointment_app/view/doctor_details.dart';
import 'package:doctor_appointment_app/view_model/doctor_favorite_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class SpecialistCard extends StatefulWidget {
  SpecialistCard({
    super.key,
    required this.width,
    this.doctorDoc
  });

  final double width;
  DoctorModel? doctorDoc;

  @override
  State<SpecialistCard> createState() => _SpecialistCardState();
}

class _SpecialistCardState extends State<SpecialistCard> {
  

  @override
  Widget build(BuildContext context) {
    final favoriteViewModel = Provider.of<DoctorFavoriteViewModel>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        width: widget.width * 1,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 3),
                color: Colors.grey.withOpacity(0.05),
                spreadRadius: 10,
                blurRadius: 20),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15.0, left: 8, right: 8, bottom: 8),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: widget.width * 0.24,
                    height: 105,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(widget.doctorDoc!.image.toString(), 
                      
                      fit: BoxFit.cover,)
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: widget.width * 0.52,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossA,
                          children: [
                            Container(
                              width: 150,
                              height: 19,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue[100]),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.verified,
                                      color: Colors.blue,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      widget.doctorDoc!.name.toString(),
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 11),
                                    )
                                  ]),
                            ),
                            // Spacer(),
                            Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () async{
                                  // final collection = await FirebaseFirestore.instance.collection("Favorite").doc().get();
                                  // DoctorFavoriteModel doctorFavoriteModel = DoctorFavoriteModel(
                                  //   createdAt: DateTime.now(),
                                  //   userRef: FirebaseFirestore.instance.collection("Users").doc(Utils.uid),
                                  //   doctorRef: FirebaseFirestore.instance.collection("Doctor").doc(widget.doctorDoc!.uid),

                                  // );

                                  // Map<String, dynamic> doctorMap = doctorFavoriteModel.toMap();
                                  // DocumentReference ref = await FirebaseFirestore.instance.collection("Favorite").add(doctorMap);

                                  // await ref.update({"uid": ref.id});
                                  // kkl

                                  favoriteViewModel.doctorLiked(widget.doctorDoc!, context);



                                },
                                child: Icon(
                                  Icons.favorite_border_rounded,
                                  color: Colors.grey[500],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.doctorDoc!.name.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.doctorDoc!.specializeIn.toString(),
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: widget.width * 0.52,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: Cross,
                          children: [
                            RatingBar.builder(
                              itemSize: 14,
                              initialRating: 4.5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            // SizedBox(width: 8,),
                            Text(
                              "4.8",
                              style: TextStyle(fontSize: 12),
                            ),

                            Container(
                              height: 15,
                              width: 1,
                              color: Colors.grey[400],
                            ),

                            Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "499 Reviews",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[500]),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DoctorDetails(doctorDoc: widget.doctorDoc,)));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: widget.width * 0.87,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[100]),
                  child: Text(
                    "Make Oppointment",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
