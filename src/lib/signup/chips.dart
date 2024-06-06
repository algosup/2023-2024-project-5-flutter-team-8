import 'package:flutter/material.dart';

class ChipsWidget extends StatefulWidget {
  final List<String> skills;
  final List<String> selectedSkills;
  final Function(List<String>) onSelectionChanged;

  const ChipsWidget({
    Key? key,
    required this.skills,
    required this.selectedSkills,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _ChipsWidgetState createState() => _ChipsWidgetState();
}

class _ChipsWidgetState extends State<ChipsWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 2.0,
        children: widget.skills.map((skill) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: chip(skill),
          );
        }).toList(),
      ),
    );
  }

  Widget chip(String label) {
    bool isSelected = widget.selectedSkills.contains(label);
    return ChoiceChip(
      showCheckmark: false,
      labelPadding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.grey,
          fontSize: 12,
        ),
      ),
      backgroundColor: isSelected ? Colors.black : Colors.white, // Use your background color
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          if (selected) {
            if (widget.selectedSkills.length < 15) {
              widget.selectedSkills.add(label);
            }
          } else {
            widget.selectedSkills.remove(label);
          }
          widget.onSelectionChanged(widget.selectedSkills);
        });
      },
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isSelected ? Colors.black : Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
