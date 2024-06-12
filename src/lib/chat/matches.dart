import 'package:adopte_1_candidat/constants.dart';
import 'package:flutter/material.dart';
import 'package:adopte_1_candidat/redundancy/navigation_bar.dart';
import 'package:flutter_svg/svg.dart';

class Matches extends StatefulWidget {
  const Matches({super.key});

  @override
  State<Matches> createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  List<bool> isSwipedList = List.generate(7, (index) => false);

  void handleSwipe(int index) {
    setState(() {
      isSwipedList[index] = true;
    });
  }

  void resetSwipe(int index) {
    setState(() {
      isSwipedList[index] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Messages',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        actions: [
          SvgPicture.asset(
            'assets/icons/edit_square.svg',
            fit: BoxFit.contain,
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      body: GestureDetector(
        onTap: () {
          setState(() {
            isSwipedList = List.generate(7, (index) => false);
          });
        },
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: size.height * 0.07,
                width: size.width * 0.85,
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search in messages',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 64,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onHorizontalDragEnd: (details) {
                          if (details.primaryVelocity! < 0) {
                            handleSwipe(index);
                          }
                        },
                        child: Stack(
                          children: [
                            if (isSwipedList[index])
                              Positioned(
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    resetSwipe(index);
                                  },
                                  child: Container(
                                    color:
                                        const Color.fromRGBO(242, 240, 250, 1),
                                    width: size.width / 8,
                                    child: const Center(
                                      child: Icon(
                                        Icons.delete_outline_rounded,
                                        color: Color.fromRGBO(117, 81, 255, 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              transform: Matrix4.translationValues(
                                  isSwipedList[index] ? -size.width / 8 : 0,
                                  0,
                                  0),
                              child: SizedBox(
                                height: size.height / 12.5,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: size.width / 32,
                                    ),
                                    CircleAvatar(
                                      backgroundImage: const AssetImage(
                                        'assets/img/we_are_evolution.png',
                                      ),
                                      radius: size.height / 32,
                                    ),
                                    SizedBox(
                                      width: size.width / 32,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: size.height / 64,
                                        ),
                                        const Text(
                                          "Andy Robertson",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height / 256,
                                        ),
                                        Container(
                                          constraints: BoxConstraints(
                                            maxWidth: size.width * 0.58,
                                            maxHeight: 20,
                                          ),
                                          child: const Text(
                                            "Oh yes, please send your CV/Resume",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color.fromRGBO(
                                                  170, 170, 170, 1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: size.height / 64,
                                        ),
                                        const Text(
                                          "5m ago",
                                          style: TextStyle(
                                            color: chatAnnotationsColor,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height / 128,
                                        ),
                                        const CircleAvatar(
                                          backgroundColor: purpleColor,
                                          radius: 9,
                                          child: Center(
                                            child: Text(
                                              "2",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: size.width / 24,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height / 64,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
    );
  }
}
