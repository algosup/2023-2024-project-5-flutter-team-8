import 'package:flutter/material.dart';
import 'package:adopte_1_candidat/constants.dart';

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

class DraggableChipsWidget extends StatefulWidget {
  final List<String> skills;
  final List<String> selectedSkills;
  final Function(List<String>) onSelectionChanged;

  const DraggableChipsWidget({
    Key? key,
    required this.skills,
    required this.selectedSkills,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _DraggableChipsWidgetState createState() => _DraggableChipsWidgetState();
}

class _DraggableChipsWidgetState extends State<DraggableChipsWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.skills.map((skill) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Draggable<String>(
              data: skill,
              feedback: Material(
                color: Colors.transparent,
                child: chip(skill, isDragging: true),
              ),
              childWhenDragging: Container(),
              child: chip(skill),
              onDragCompleted: () {
                setState(() {
                  widget.skills.remove(skill);
                  widget.onSelectionChanged(widget.selectedSkills);
                });
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget chip(String label, {bool isDragging = false}) {
    bool isSelected = widget.selectedSkills.contains(label);
    return ChoiceChip(
      showCheckmark: false,
      labelPadding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.bold,
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
          color: isSelected ? Colors.black : Colors.black,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}

class TargetChipsWidget extends StatefulWidget {
  final List<String> selectedSkills;
  final List<String> availableSkills;
  final Function(List<String>) onSelectionChanged;

  const TargetChipsWidget({
    Key? key,
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          15,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: chip(index),
          ),
        ),
      ),
    );
  }

  Widget chip(int index) {
    String label = widget.selectedSkills.length > index ? widget.selectedSkills[index] : '';
    return DragTarget<String>(
      onWillAccept: (data) => label.isEmpty,
      onAccept: (receivedItem) {
        setState(() {
          if (label.isNotEmpty) {
            widget.availableSkills.add(label);
          }
          widget.selectedSkills[index] = receivedItem;
          widget.onSelectionChanged(widget.selectedSkills);
        });
      },
      builder: (context, candidateData, rejectedData) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Chip(
            backgroundColor: Colors.white,
            label: label.isEmpty
                ? const Text(
                    'Drag here',
                    style: TextStyle(
                      color: purpleColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text(
                    label,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: label.isEmpty ? purpleColor : Colors.grey,
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
