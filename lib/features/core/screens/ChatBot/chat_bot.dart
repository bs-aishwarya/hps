import 'package:flutter/material.dart';
import 'package:hps/features/core/controllers/chatbot_controller.dart';
import 'package:hps/features/core/screens/ChatBot/widgets/all_chats.dart';
import 'package:hps/features/core/screens/ChatBot/widgets/custom_user_msg_text_field.dart';
import 'package:hps/utils/constants/images_strings.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final chatController = ChatBotController.instance;

  final userMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 15, 69, 79),
        centerTitle: true,
        title: Text(
          "Chat Bot",
          style: Theme.of(
            context,
          ).textTheme.headlineSmall!.copyWith(color: Colors.white),
        ),
        leading: const Icon(Icons.chat, color: Colors.white),
      ),
      body: Container(
        /// --Chat Screen Background
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(MyAppImages.emojiBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // --Chats
            AllChats(chatController: chatController),

            // --User Message Text Field
            Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: CustomUserMsgTextField(
                userMessageController: userMessageController,
                chatController: chatController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
