import 'package:flutter/material.dart';

import 'package:adopte_1_candidat/constants.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        if (onChanged != null) {
          onChanged!(!value);
        }
      },
      child: Container(
        height: size.height * 0.03,
        width: size.height * 0.03,
        decoration: BoxDecoration(
          color: value ? purpleColor : purpleColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: value
            ? const Icon(
                Icons.check,
                size: 20,
                color: Colors.black,
              )
            : null,
      ),
    );
  }
}