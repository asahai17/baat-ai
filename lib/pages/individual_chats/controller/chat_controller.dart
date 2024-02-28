import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappchat/pages/individual_chats/model/message_model.dart';

class ChatController extends GetxController {
  RxList<MessageModel> chatList = <MessageModel>[].obs;
  TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    chatList.add(
      MessageModel(
        id: DateTime.now().microsecond.toString(),
        message: "Hey! how are you?",
        isMine: false,
      ),
    );
    super.onInit();
  }

  sendMessage() async {
    chatList.add(
      MessageModel(
        id: DateTime.now().microsecond.toString(),
        message: textController.text,
        isMine: true,
      ),
    );
    textController.clear();
    await Future.delayed(const Duration(seconds: 1));
    chatList.add(
      MessageModel(
        id: DateTime.now().microsecond.toString(),
        message: "Message received",
        isMine: false,
      ),
    );
  }
}
