import 'package:adopte_1_candidat/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter_svg/svg.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: () {
              debugPrint('Search Icon Pressed');
            },
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      body: Center(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: size.height / 12,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 3 * (size.width / 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: size.width / 27,
                              ),
                              CircleAvatar(
                                backgroundImage: const AssetImage(
                                    'assets/img/we_are_evolution.png'),
                                radius: size.height / 32,
                              ),
                              SizedBox(
                                width: size.width / 27,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Orlando Diggs',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: const Color.fromRGBO(
                                            78, 193, 51, 1),
                                        size: size.width / 36,
                                      ),
                                      SizedBox(
                                        width: size.width / 64,
                                      ),
                                      const Text(
                                        'Online',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width / 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.phone_outlined,
                                color: purpleColor,
                                size: size.width / 15,
                              ),
                              SizedBox(
                                width: size.width / 36,
                              ),
                              Icon(
                                Icons.search,
                                color: purpleColor,
                                size: size.width / 15,
                              ),
                              SizedBox(
                                width: size.width / 24,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height / 72,
                  ),
                  const Center(
                    child: Text(
                      'Today',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: chatAnnotationsColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  //Chat bubble (us)
                  SizedBox(
                    height: size.height / 36,
                  ),
                  BubbleNormal(
                    text: 'Hello Sir, Good Morning',
                    isSender: true,
                    color: Colors.black,
                    tail: true,
                    margin: EdgeInsets.only(right: size.width / 64),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 256,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        '09:30 am',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: chatAnnotationsColor,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: size.width / 64,
                      ),
                      const Icon(
                        size: 19,
                        Icons.done_all,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: size.width / 16,
                      ),
                    ],
                  ),
                  //Chat bubble (interlocutor)
                  SizedBox(
                    height: size.height / 72,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width / 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            backgroundImage: const AssetImage(
                                'assets/img/we_are_evolution.png'),
                            radius: size.height / 48,
                          ),
                        ],
                      ),
                      BubbleNormal(
                        text: 'Morning, Can i help you ?',
                        constraints: BoxConstraints(
                          maxWidth: 7 * (size.width / 9),
                        ),
                        isSender: false,
                        color: chatNotSenderBackgroundColor,
                        tail: true,
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: chatNotSenderTextColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 256,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width / 6,
                      ),
                      const Text(
                        '09:30 am',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: chatAnnotationsColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  // Bubble us
                  SizedBox(
                    height: size.height / 36,
                  ),
                  BubbleNormal(
                    text:
                        'I saw the UI/UX Designer vacancy that you uploaded on linkedin yesterday and I am interested in joining your company.',
                    constraints: BoxConstraints(
                      maxWidth: 7 * (size.width / 9),
                    ),
                    isSender: true,
                    color: Colors.black,
                    tail: true,
                    margin: EdgeInsets.only(right: size.width / 64),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 256,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        '09:33 am',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: chatAnnotationsColor,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: size.width / 64,
                      ),
                      const Icon(
                        size: 19,
                        Icons.done_all,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: size.width / 16,
                      ),
                    ],
                  ),
                  //Bubble them
                  SizedBox(
                    height: size.height / 72,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width / 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            backgroundImage: const AssetImage(
                                'assets/img/we_are_evolution.png'),
                            radius: size.height / 48,
                          ),
                        ],
                      ),
                      BubbleNormal(
                        text: 'Oh yes, please send your CV/Resume here',
                        constraints: BoxConstraints(
                          maxWidth: 7 * (size.width / 9),
                        ),
                        isSender: false,
                        color: chatNotSenderBackgroundColor,
                        tail: true,
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: chatNotSenderTextColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 256,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width / 6,
                      ),
                      const Text(
                        '09:33 am',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: chatAnnotationsColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  // Attachment us
                  SizedBox(
                    height: size.height / 72,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: size.height / 72,
                      ),
                      Container(
                        height: size.height / 12,
                        width: 3 * (size.width / 5),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: Colors.black,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width / 48,
                            ),
                            SizedBox(
                              width: size.width / 8,
                              child: SvgPicture.asset(
                                'assets/img/pdf_icon.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              width: size.width / 48,
                            ),
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: size.width / 3.3,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Jamet- CV - UI/UX Designer.PDF',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                  SizedBox(
                                    height: size.height / 312,
                                  ),
                                  const Text(
                                    '867 KB PDF',
                                    style: TextStyle(
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
                            SizedBox(
                              width: size.width / 48,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width / 16,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 256,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        '09:38 am',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: chatAnnotationsColor,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: size.width / 64,
                      ),
                      const Icon(
                        size: 19,
                        Icons.done,
                        color: Colors.black45,
                      ),
                      SizedBox(
                        width: size.width / 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MessageBar(
                onSend: (_) => print(_),
                sendButtonColor: Colors.black,
                messageBarColor: Colors.white,
                messageBarHintStyle:
                    const TextStyle(color: chatAnnotationsColor, fontSize: 15),
                actions: [
                  InkWell(
                    child: SvgPicture.asset(
                      'assets/icons/attachment.svg',
                      fit: BoxFit.contain,
                      height: 24,
                      width: 24,
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(
                    width: 14,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
