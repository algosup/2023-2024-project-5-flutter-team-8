import 'dart:async';
import 'package:adopte_1_candidat/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'bubbles_footer.dart';
import 'success_popup.dart';
import 'denied_popup.dart';

class BubblePopup extends StatefulWidget {
  final String logoPath;

  BubblePopup({required this.logoPath});

  @override
  _BubblePopupState createState() => _BubblePopupState();
}

class _BubblePopupState extends State<BubblePopup> {
  int activeIndex = 0;
  Timer? _inactivityTimer;
  bool _isBlurred = false;
  bool _hasShownBlur = false; // Flag to track if blur has been shown

  @override
  void initState() {
    super.initState();
    _startInactivityTimer();
  }

  @override
  void dispose() {
    _inactivityTimer?.cancel();
    super.dispose();
  }

  void _startInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(Duration(seconds: 5), () {
      if (!_hasShownBlur) {
        setState(() {
          _isBlurred = true;
          _hasShownBlur = true; // Mark that the blur has been shown
        });
      }
    });
  }

  void _resetInactivityTimer() {
    if (_isBlurred) {
      setState(() {
        _isBlurred = false;
      });
    }
    _startInactivityTimer();
  }

  void _onUserInteraction() {
    _resetInactivityTimer();
  }

  void _showSuccessPopup(BuildContext context) {
    Navigator.of(context).pop();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SuccessPopup(
          message: "You've applied for the job. Expect a message from the company in a few days.",
        );
      },
    );
  }

  void _showConfirmationPopup(BuildContext context) {
    Navigator.of(context).pop();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ConfirmationPopup(
          onConfirm: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return SuccessPopup(
                  message: 'You have denied the job offer.',
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _onUserInteraction,
      onPanDown: (_) => _onUserInteraction(),
      child: AlertDialog(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: EdgeInsets.zero, // Remove the default padding
        content: Stack(
          children: [
            Container(
              height: 300, // Adjust height to fit content and footer
              width: double.maxFinite, // Ensures the content fits within the dialog
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          child: CarouselSlider(
                            items: [
                              // First custom page
                              Padding(
                                padding: EdgeInsets.only(left: 20, top: 20), // add left margin
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(widget.logoPath, width: 50, height: 50),
                                            Text(
                                              'Company Name',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              'Job Name',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 20),
                                          child: Row(
                                            children: [
                                              Icon(Icons.location_on, size: 14),
                                              SizedBox(width: 5),
                                              Text(
                                                'Location',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_today, size: 14),
                                        SizedBox(width: 5),
                                        Text(
                                          'Starts Jul 30, 2024',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Second page
                              Container(
                                color: backgroundColor,
                                child: Image.asset(widget.logoPath, fit: BoxFit.cover),
                              ),
                              // Third page
                              Container(
                                color: backgroundColor,
                                child: Image.asset(widget.logoPath, fit: BoxFit.cover),
                              ),
                            ],
                            options: CarouselOptions(
                              height: double.infinity,
                              aspectRatio: 16 / 9,
                              viewportFraction: 1.0,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: false,
                              enlargeCenterPage: false,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  activeIndex = index;
                                });
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          top: 16,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: AnimatedSmoothIndicator(
                              activeIndex: activeIndex,
                              count: 3,
                              effect: WormEffect(
                                activeDotColor: Colors.black,
                                dotHeight: 8,
                                dotWidth: 8,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Static Footer
                  BubbleFooter(
                    onApply: () {
                      _showSuccessPopup(context);
                    },
                    onDenied: () {
                      _showConfirmationPopup(context);
                    },
                  ),
                ],
              ),
            ),
            if (_isBlurred)
              GestureDetector(
                onTap: _onUserInteraction,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.swipe, size: 50, color: Colors.white),
                        SizedBox(height: 10),
                        Text(
                          'Swipe to browse',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

