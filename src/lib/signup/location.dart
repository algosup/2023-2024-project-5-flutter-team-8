import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;

import 'package:adopte_1_candidat/redundancy/arrow_button.dart';
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
  String? _locationSelectionError; // Add this variable
  double currentSliderValue = 100;
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
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            LinearPercentIndicator(
              width: size.width,
              percent: 0.6,
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
                  height: size.height / 6,
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
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomTextField(
                    controller: locationController,
                    hintText: 'City, Country',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                    prefixIcon: const Icon(
                      Icons.location_on,
                      color: purpleColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 5,
                ),
                ContinueButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      String location = locationController.text;
                      if (!isLocationValid(location) &&
                          !isDistanceValid(selectedDistance)) {
                        setState(() {
                          _locationSelectionError =
                              'Please select a distance and enter a location';
                        });
                      } else if (!isLocationValid(location)) {
                        setState(() {
                          _locationSelectionError = 'Please enter a location';
                        });
                      } else if (!isDistanceValid(selectedDistance)) {
                        setState(() {
                          _locationSelectionError = 'Please select a distance';
                        });
                      } else {
                        await _saveSelectedLocation();
                        GoRouter.of(context).push('/setProfilePicture');
                      }
                    }
                  },
                ),
                if (_locationSelectionError != null)
                  SizedBox(
                    height: size.height * 0.05,
                    child: Center(
                      child: Text(
                        _locationSelectionError!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool isDistanceValid(String? value) {
    return value != null && value.isNotEmpty;
  }

  bool isLocationValid(String? value) {
    return value != null && value.isNotEmpty;
  }
}