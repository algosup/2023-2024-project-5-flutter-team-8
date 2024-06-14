import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:adopte_1_candidat/signup/icon_grid.dart';
import '../constants.dart';

class UpdateProfilePicture extends StatefulWidget {
  const UpdateProfilePicture({super.key});

  @override
  _UpdateProfilePictureState createState() => _UpdateProfilePictureState();
}

class _UpdateProfilePictureState extends State<UpdateProfilePicture> {
  String? selectedAvatar;
  String? _avatarSelectionError;

  @override
  void initState() {
    super.initState();
    _loadSelectedAvatar();
  }

  Future<void> _loadSelectedAvatar() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/data.json';
    final file = File(filePath);

    if (await file.exists()) {
      final data = await file.readAsString();
      final dynamic parsedData = jsonDecode(data);

      if (parsedData is Map<String, dynamic>) {
        final Map<String, dynamic> jsonData = parsedData;

        if (jsonData.containsKey('users') && jsonData['users'] is Map<String, dynamic>) {
          final users = jsonData['users'] as Map<String, dynamic>;
          if (users.containsKey('1') && users['1'] is Map<String, dynamic>) {
            final user = users['1'] as Map<String, dynamic>;
            setState(() {
              selectedAvatar = user['avatar'] as String?;
            });
          }
        }
      }
    }
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
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: size.height / 20,
            ),
            IconGrid(
              size: size,
              selectedAvatar: selectedAvatar,
              onAvatarSelected: (String? avatar) {
                setState(() {
                  selectedAvatar = avatar;
                });
              },
            ),
            SizedBox(
              height: size.height / 15,
            ),
            ContinueButton(
              onPressed: () async {
                if (selectedAvatar != null) {
                  await _saveSelectedAvatar();
                  GoRouter.of(context).push('/profile');
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
      ),
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
