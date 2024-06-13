import 'dart:async';
import 'package:adopte_1_candidat/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'bubbles_footer.dart';
import 'package:adopte_1_candidat/job_offer_database/job_offer.dart';
import 'package:adopte_1_candidat/job_offer_database/job_offer_data.dart';
import 'success_popup.dart';
import 'denied_popup.dart';

class BubblePopup extends StatefulWidget {
  final String logoPath;
  final VoidCallback onRemoveBubble;

  BubblePopup({required this.logoPath, required this.onRemoveBubble});
  
  @override
  _BubblePopupState createState() => _BubblePopupState();
}

class _BubblePopupState extends State<BubblePopup> {
  int activeIndex = 0; // To track the active index of the carousel
  Timer? _inactivityTimer; // Timer to track user inactivity
  bool _isBlurred = false; // Flag to determine if the screen is blurred
  bool _hasShownBlur = false; // Flag to track if blur has been shown
  late JobOffer currentJobOffer; // To hold the current job offer details

  @override
  void initState() {
    super.initState();
    _startInactivityTimer();
    currentJobOffer = _getJobOffer(widget.logoPath);
  }

  @override
  void dispose() {
    _inactivityTimer?.cancel();
    super.dispose();
  }

    // Fetch the job offer based on logoPath
  JobOffer _getJobOffer(String logoPath) {
    return jobOffers.firstWhere((job) => job.logoPath == logoPath);
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
  showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return SuccessPopup(
        message: "You've applied for the job. Expect a message from the company in a few days.",
      );
    },
  ).then((result) {
    if (result == true) {
      widget.onRemoveBubble();
    }
  });
}

void _showConfirmationPopup(BuildContext context) {
  Navigator.of(context).pop();
  showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return ConfirmationPopup(
        icon: Icon(Icons.cancel, color: Colors.red),
        onConfirm: () {
          Navigator.of(context).pop(); // Close the confirmation dialog
        },
      );
    },
  ).then((result) {
    if (result == true) {
      widget.onRemoveBubble();
    }
  });
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
                                              currentJobOffer.companyName,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              currentJobOffer.jobName,
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
                                                currentJobOffer.location,
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
                                          currentJobOffer.startDate,
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        currentJobOffer.description,
                                        style: TextStyle(
                                          fontSize: 15,
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
                                child: Image.asset(currentJobOffer.image1, fit: BoxFit.cover),
                              ),
                              // Third page
                              Container(
                                color: backgroundColor,
                                child: Image.asset(currentJobOffer.image2, fit: BoxFit.cover),
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

