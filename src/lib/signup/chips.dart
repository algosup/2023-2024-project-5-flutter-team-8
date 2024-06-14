import 'package:flutter/material.dart';
import '../constants.dart';

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
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Wrap(
            spacing: 2.0,
            children: widget.skills.map((skill) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: chip(skill),
              );
            }).toList(),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
        ],
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
      backgroundColor: isSelected ? Colors.black : Colors.white,
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

class DraggableChipsWidget extends StatelessWidget {
  final String skill;
  final Function(String) onDragCompleted;

  const DraggableChipsWidget({
    Key? key,
    required this.skill,
    required this.onDragCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.05,
      child: Draggable<String>(
        data: skill,
        feedback: Material(
          color: Colors.transparent,
          child: chip(skill, isDragging: true),
        ),
        childWhenDragging: Container(),
        onDragCompleted: () => onDragCompleted(skill),
        child: chip(skill),
      ),
    );
  }

  Widget chip(String label, {bool isDragging = false}) {
    return Chip(
      backgroundColor: isDragging ? Colors.grey[300] : Colors.white,
      label: Text(
        label,
        style: TextStyle(
          color: isDragging ? Colors.grey : Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}

class TargetChipsWidget extends StatefulWidget {
  final int index;
  final List<String> selectedSkills;
  final List<String> availableSkills;
  final Function(List<String>) onSelectionChanged;

  const TargetChipsWidget({
    Key? key,
    required this.index,
    required this.selectedSkills,
    required this.availableSkills,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _TargetChipsWidgetState createState() => _TargetChipsWidgetState();
}

class _TargetChipsWidgetState extends State<TargetChipsWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String label = widget.selectedSkills[widget.index];

    return DragTarget<String>(
      onWillAccept: (data) => label.isEmpty,
      onAccept: (receivedItem) {
        setState(() {
          if (label.isNotEmpty) {
            widget.availableSkills.add(label);
          }
          widget.selectedSkills[widget.index] = receivedItem;
          widget.availableSkills.remove(receivedItem);
          widget.onSelectionChanged(widget.selectedSkills);
        });
      },
      builder: (context, candidateData, rejectedData) {
        return SizedBox(
          width: size.width * 0.25,
          height: size.height * 0.05,
          child: Chip(
            backgroundColor: label.isEmpty ? Colors.white : purpleColor,
            label: Text(
              label.isEmpty ? 'Drag here' : label,
              style: TextStyle(
                color: label.isEmpty ? purpleColor : Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: label.isEmpty ? purpleColor : Colors.black,
                width: label.isEmpty ? 2.0 : 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        );
      },
    );
  }
}
