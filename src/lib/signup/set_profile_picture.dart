import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:adopte_1_candidat/redundancy/arrow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../constants.dart';

class SetProfilePicture extends StatefulWidget {
  const SetProfilePicture({super.key});

  @override
  _SetProfilePictureState createState() => _SetProfilePictureState();
}

class _SetProfilePictureState extends State<SetProfilePicture> {
  final _formKey = GlobalKey<FormState>();
  String? selectedAvatar;
  String? _avatarSelectionError;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _saveSelectedAvatar() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/data.json';
    final file = File(filePath);

    if (await file.exists()) {
      final data = await file.readAsString();
      final dynamic parsedData = jsonDecode(data);

      if (parsedData is Map<String, dynamic>) {
        final Map<String, dynamic> jsonData = parsedData;

        // Assuming we update the avatar for user with ID '1'
        if (jsonData.containsKey('users') && jsonData['users'] is Map<String, dynamic>) {
          final users = jsonData['users'] as Map<String, dynamic>;
          if (users.containsKey('1') && users['1'] is Map<String, dynamic>) {
            final user = users['1'] as Map<String, dynamic>;
            user['avatar'] = selectedAvatar;

            await file.writeAsString(jsonEncode(jsonData));
            developer.log('data.json content: $jsonData', name: 'SaveSelectedAvatar');
          } else {
            developer.log('Error: User with ID 1 not found or invalid format', name: 'SaveSelectedAvatar');
          }
        } else {
          developer.log('Error: Users data not found or invalid format', name: 'SaveSelectedAvatar');
        }
      } else {
        developer.log('Error: Parsed data is not a Map<String, dynamic>', name: 'SaveSelectedAvatar');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              LinearPercentIndicator(
                width: size.width,
                percent: 1,
                animation: true,
                backgroundColor: Colors.black,
                progressColor: purpleColor,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: ArrowButton()
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: size.width * 0.72,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Profile Picture',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Pick Your Animal Avatar',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: size.height / 20,
                  ),
                  _buildIconRow([
                    'assets/iconProfile/cat.svg',
                    'assets/iconProfile/frog.svg',
                    'assets/iconProfile/owl.svg',
                  ], size),
                  _buildIconRow([
                    'assets/iconProfile/monkey.svg',
                    'assets/iconProfile/fox.svg',
                    'assets/iconProfile/lion.svg',
                  ], size),
                  _buildIconRow([
                    'assets/iconProfile/wolf.svg',
                    'assets/iconProfile/dog.svg',
                    'assets/iconProfile/tiger.svg',
                  ], size),
                  _buildIconRow([
                    'assets/iconProfile/deer.svg',
                    'assets/iconProfile/bear.svg',
                    'assets/iconProfile/panda.svg',
                  ], size),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  ContinueButton(
                    onPressed: () async {
                      if (selectedAvatar != null) {
                        await _saveSelectedAvatar();
                        GoRouter.of(context).go('/verifyEmail');
                      } else {
                        setState(() {
                          _avatarSelectionError = 'Please select an avatar';
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                    child: Center(
                      child: Text(
                        _avatarSelectionError ?? '',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildIconRow(List<String> assetPaths, Size size) {
    double iconSize = size.width / 5;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: assetPaths.map((path) => GestureDetector(
        onTap: () {
          setState(() {
            if (selectedAvatar == path) {
              selectedAvatar = null;
            } else {
              selectedAvatar = path;
            }
            _avatarSelectionError = null;
          });
        },
        child: Container(
          padding: EdgeInsets.all(15),
          width: iconSize * 1.4,
          height: iconSize * 1.4,
          decoration: BoxDecoration(
            color: selectedAvatar == path ? purpleColor : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(path),
        ),
      )).toList(),
    );
  }
}

class ContinueButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ContinueButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: purpleColor,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      child: const Text('CONTINUE'),
    );
  }
}
