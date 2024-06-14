import 'package:adopte_1_candidat/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconGrid extends StatefulWidget {
  final Size size;
  final String? selectedAvatar;
  final ValueChanged<String?> onAvatarSelected;

  IconGrid({required this.size, required this.selectedAvatar, required this.onAvatarSelected});

  @override
  _IconGridState createState() => _IconGridState();
}

class _IconGridState extends State<IconGrid> {
  Row _buildIconRow(List<String> assetPaths) {
    double iconSize = widget.size.width / 5;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: assetPaths.map((path) => GestureDetector(
        onTap: () {
          widget.onAvatarSelected(path == widget.selectedAvatar ? null : path);
        },
        child: Container(
          padding: EdgeInsets.all(15),
          width: iconSize * 1.4,
          height: iconSize * 1.4,
          decoration: BoxDecoration(
            color: widget.selectedAvatar == path ? purpleColor : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(path),
        ),
      )).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildIconRow([
          'assets/iconProfile/cat.svg',
          'assets/iconProfile/frog.svg',
          'assets/iconProfile/owl.svg',
        ]),
        _buildIconRow([
          'assets/iconProfile/monkey.svg',
          'assets/iconProfile/fox.svg',
          'assets/iconProfile/lion.svg',
        ]),
        _buildIconRow([
          'assets/iconProfile/wolf.svg',
          'assets/iconProfile/dog.svg',
          'assets/iconProfile/tiger.svg',
        ]),
        _buildIconRow([
          'assets/iconProfile/deer.svg',
          'assets/iconProfile/bear.svg',
          'assets/iconProfile/panda.svg',
        ]),
      ],
    );
  }
}