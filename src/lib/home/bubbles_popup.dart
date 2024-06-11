import 'package:adopte_1_candidat/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'bubbles_footer.dart';

class BubblePopup extends StatefulWidget {
  final String logoPath;

  BubblePopup({required this.logoPath});

  @override
  _BubblePopupState createState() => _BubblePopupState();
}

class _BubblePopupState extends State<BubblePopup> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      contentPadding: EdgeInsets.zero, // Remove the default padding
      content: Container(
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
                  child:
                  CarouselSlider(
                    items: [
                      // First custom page
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(widget.logoPath, width: 50, height: 50),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'McDonald\'s',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '62 Av. du 19 Mars 1962 CC HYPER U,\n18100 Vierzon, France',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Waiter',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Starts Jul 30, 2024',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Lorem ipsum Lorem ipsum Lorem\nipsum Lorem ipsum Lorem ipsum\nLorem ipsum Lorem ipsum Lorem\nipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                            ),
                          ),
                        ],
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
            //SizedBox(height: 2),
            // Static Footer
            BubbleFooter(
              onApply: () {
                // Handle apply action
              },
              onDenied: () {
                // Handle denied action
              },
            ),
          ],
        ),
      ),
    );
  }
}