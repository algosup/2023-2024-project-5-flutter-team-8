import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../constants.dart';
import '../redundancy/text_fields.dart';
import 'set_profile_picture.dart';

class SetLocation extends StatefulWidget {
  const SetLocation({super.key});

  @override
  _SetLocationState createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
  final _formKey = GlobalKey<FormState>();
  String? selectedDistance;
  String? _locationSelectionError;
  double currentSliderValue = 156;
  final TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _saveSelectedLocation() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/data.json';
    final file = File(filePath);

    if (await file.exists()) {
      final data = await file.readAsString();
      final dynamic parsedData = jsonDecode(data);

      if (parsedData is Map<String, dynamic>) {
        final Map<String, dynamic> jsonData = parsedData;

        // Assuming we update the location for user with ID '1'
        if (jsonData.containsKey('users') &&
            jsonData['users'] is Map<String, dynamic>) {
          final users = jsonData['users'] as Map<String, dynamic>;
          if (users.containsKey('1') && users['1'] is Map<String, dynamic>) {
            final user = users['1'] as Map<String, dynamic>;
            user['distance'] = selectedDistance;
            user['location'] = locationController.text;

            await file.writeAsString(jsonEncode(jsonData));
            developer.log('data.json content: $jsonData',
                name: 'SaveSelectedLocation');
          } else {
            developer.log('Error: User with ID 1 not found or invalid format',
                name: 'SaveSelectedLocation');
          }
        } else {
          developer.log('Error: Users data not found or invalid format',
              name: 'SaveSelectedLocation');
        }
      } else {
        developer.log('Error: Parsed data is not a Map<String, dynamic>',
            name: 'SaveSelectedLocation');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              LinearPercentIndicator(
                width: size.width,
                percent: 0.8,
                animation: true,
                backgroundColor: Colors.black,
                progressColor: purpleColor,
              ),
              SizedBox(
                height: size.height * 0.05,
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
                              'Location',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Select Your Job Location Preferences',
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
                  Container(
                    padding:
                        const EdgeInsets.only(top: 24.0, left: 8.0, right: 8.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('0km'), Text('200km')],
                    ),
                  ),
                  Slider(
                    activeColor: purpleColor,
                    value: currentSliderValue,
                    max: 200,
                    divisions: 200,
                    label: currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        currentSliderValue = value;
                        selectedDistance = '${value.round()}km';
                      });
                    },
                  ),
                  SizedBox(
                    height: size.height / 15,
                  ),
                  CustomTextField(
                    controller: locationController,
                    hintText: 'City, Country',
                    errorText: _locationSelectionError,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a location';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height / 15,
                  ),
                  ContinueButton(
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        String location = locationController.text;
                        if (isLocationValid(location)) {
                          await _saveSelectedLocation();
                          GoRouter.of(context).go('/setProfilePicture');
                        }// else {
                        //   onError('Please fill out all fields correctly');
                        // }
                      }
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                    child: Center(
                      child: Text(
                        _locationSelectionError ?? '',
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

  bool isLocationValid(String? value) {
    return value != null && value.isNotEmpty;
  }
}

// class ContinueButton extends RoundButton {
//   @override
//   final VoidCallback onPressed;
  
//   final Function(String?) onError;

//   const ContinueButton({
//     super.key,
//     required this.onPressed,
//     required this.onError, required super.size, required super.color, required super.text,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: purpleColor,
//         padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//         textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//       ),
//       child: const Text('CONTINUE'),
//     );
//   }
// }
