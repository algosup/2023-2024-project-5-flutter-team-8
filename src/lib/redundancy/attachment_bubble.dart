import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adopte_1_candidat/constants.dart';

class AttachmentBubble extends StatelessWidget {
  final String fileName;
  final String fileSize;
  final String timestamp;

  const AttachmentBubble({
    super.key,
    required this.fileName,
    required this.fileSize,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: size.height / 12,
              width: 3 * (size.width / 5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Colors.black,
              ),
              child: Row(
                children: [
                  SizedBox(width: size.width / 48),
                  SizedBox(
                    width: size.width / 8,
                    child: SvgPicture.asset(
                      'assets/img/pdf_icon.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: size.width / 48),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: size.width / 3.3,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fileName,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 13),
                        ),
                        SizedBox(height: size.height / 312),
                        Text(
                          fileSize,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.more_vert_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                  SizedBox(width: size.width / 48),
                ],
              ),
            ),
            SizedBox(width: size.width / 24),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              timestamp,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: chatAnnotationsColor,
                fontSize: 14,
              ),
            ),
            SizedBox(width: size.width / 64),
            const Icon(
              Icons.done,
              color: Colors.black45,
              size: 19,
            ),
            SizedBox(width: size.width / 16),
          ],
        ),
      ],
    );
  }
}
