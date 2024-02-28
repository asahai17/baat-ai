import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappchat/pages/home_page/controller/home_controller.dart';
import 'package:whatsappchat/pages/home_page/views/tabs/chat_page/chat_tile.dart';

class ChatListingScreen extends StatelessWidget {
  const ChatListingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) {
        return controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.chatList.length,
                itemBuilder: (context, index) {
                  return ChatTile(
                    chatModel: controller.chatList[index],
                  );
                },
              );
      },
    );
  }
}
