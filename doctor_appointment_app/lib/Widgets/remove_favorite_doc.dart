import 'package:flutter/material.dart';


class RemoveFavriteDoctor extends StatelessWidget {
  const RemoveFavriteDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width * 1,
      color: Colors.blue,
      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
    ),
    
    
    );
  }
}