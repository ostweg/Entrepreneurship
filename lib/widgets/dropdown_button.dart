import 'package:flutter/material.dart';

/// Flutter code sample for [DropdownButton].

const List<String> list = <String>['Harmony Haven', 'Artistic Expressions', 'Food for All', 'EcoWarriors'];

class EasyDropdownButton extends StatefulWidget {
  const EasyDropdownButton({super.key});

  @override
  State<EasyDropdownButton> createState() => _EasyDropdownButtonState();
}

class _EasyDropdownButtonState extends State<EasyDropdownButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down),
      elevation: 16,
      style: const TextStyle(color: const Color(0xFF4c8bfc)),
      underline: Container(
        height: 2,
        color:const Color(0xFF4c8bfc),
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
