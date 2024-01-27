import 'package:flutter/material.dart';


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Chip Choice Example'),
//         ),
//         body: Center(
//           child: ChoiceChips(),
//         ),
//       ),
//     );
//   }
// }

class ChoiceChips extends StatefulWidget {
  @override
  _ChoiceChipsState createState() => _ChoiceChipsState();
}

class _ChoiceChipsState extends State<ChoiceChips> {
  List<String> choices = ['Option 1', 'Option 2', 'Option 3'];
  String selectedChoice = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: choices.map((String choice) {
            return ChoiceChip(
              label: Text(choice),
              selected: selectedChoice == choice,
              onSelected: (bool selected) {
                setState(() {
                  selectedChoice = selected ? choice : '';
                });
              },
            );
          }).toList(),
        ),
        SizedBox(height: 16.0),
        Text('Selected Choice: $selectedChoice'),
      ],
    );
  }
}
