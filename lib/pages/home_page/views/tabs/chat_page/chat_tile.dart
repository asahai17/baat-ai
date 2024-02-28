import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappchat/pages/home_page/model/chat_model.dart';
import 'package:whatsappchat/pages/individual_chats/views/chat_page.dart';

class ChatTile extends StatelessWidget {
  final ChatModel chatModel;
  const ChatTile({super.key, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(
          () => WhatsAppChatPage(
            chatModel: chatModel,
          ),
        );
      },
      leading: CircleAvatar(
        backgroundImage: AssetImage(
          chatModel.imgurl!,
        ),
      ),
      title: Text(
        chatModel.name.toString(),
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
      subtitle: Row(
        children: [
          const Icon(
            Icons.done_all,
            color: Colors.grey,
          ),
          Text(
            chatModel.lastMessage.toString(),
            style: const TextStyle(
                color: Colors.black38, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      trailing: const Text(
        '12:00 PM',
        style: TextStyle(
          color: Colors.black38,
        ),
      ),
    );
  }
}
