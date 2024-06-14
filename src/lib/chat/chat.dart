import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adopte_1_candidat/constants.dart';
import 'package:adopte_1_candidat/redundancy/attachment_bubble.dart';
import 'package:adopte_1_candidat/redundancy/chat_bubble.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Scroll to bottom after the frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent - 70);
    }
  }

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
              debugPrint('More Icon Pressed');
            },
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
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
                        SizedBox(width: size.width / 27),
                        CircleAvatar(
                          backgroundImage: const AssetImage(
                              'assets/img/we_are_evolution.png'),
                          radius: size.height / 32,
                        ),
                        SizedBox(width: size.width / 27),
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
                                  color: const Color.fromRGBO(78, 193, 51, 1),
                                  size: size.width / 36,
                                ),
                                SizedBox(width: size.width / 64),
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
                        SizedBox(width: size.width / 36),
                        Icon(
                          Icons.search,
                          color: purpleColor,
                          size: size.width / 15,
                        ),
                        SizedBox(width: size.width / 24),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                controller: _scrollController,
                padding: EdgeInsets.only(bottom: size.height / 12),
                children: [
                  SizedBox(height: size.height / 72),
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
                  SizedBox(height: size.height / 36),
                  const ChatBubble(
                    text: 'Hello Sir, Good Morning',
                    isSender: true,
                    timestamp: '09:30 am',
                    isSeen: true,
                  ),
                  SizedBox(height: size.height / 72),
                  const ChatBubble(
                    text: 'Morning, Can I help you?',
                    isSender: false,
                    timestamp: '09:30 am',
                    showAvatar: true,
                    avatarImage: 'assets/img/we_are_evolution.png',
                  ),
                  SizedBox(height: size.height / 36),
                  const ChatBubble(
                    text:
                        'I saw the UI/UX Designer vacancy that you uploaded on LinkedIn yesterday and I am interested in joining your company.',
                    isSender: true,
                    timestamp: '09:33 am',
                    isSeen: true,
                  ),
                  SizedBox(height: size.height / 72),
                  const ChatBubble(
                    text: 'Oh yes, please send your CV/Resume here',
                    isSender: false,
                    timestamp: '09:33 am',
                    showAvatar: true,
                    avatarImage: 'assets/img/we_are_evolution.png',
                  ),
                  SizedBox(height: size.height / 36),
                  const AttachmentBubble(
                    fileName: 'Jamet- CV - UI/UX Designer.PDF',
                    fileSize: '867 KB PDF',
                    timestamp: '09:38 am',
                  ),
                  SizedBox(height: size.height / 72),
                  const ChatBubble(
                    text: 'Thanks a lot, I will recontact you ASAP!',
                    isSender: false,
                    timestamp: '09:43 am',
                    showAvatar: true,
                    avatarImage: 'assets/img/we_are_evolution.png',
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MessageBar(
                onSend: (message) {
                  // Handle sending a new message
                  // Scroll to the bottom after sending a new message
                  setState(() {
                    // Add your message handling logic here
                  });
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
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
                  const SizedBox(width: 14),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
