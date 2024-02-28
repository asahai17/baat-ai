import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappchat/constant/app_colors.dart';
import 'package:whatsappchat/pages/home_page/controller/home_controller.dart';
import 'package:whatsappchat/pages/home_page/model/chat_model.dart';
import 'package:whatsappchat/pages/individual_chats/controller/chat_controller.dart';
import 'package:whatsappchat/pages/individual_chats/views/chat_detail.dart';
import 'package:whatsappchat/pages/individual_chats/views/components/message_tile_other.dart';
import 'package:whatsappchat/pages/individual_chats/views/components/message_tile_own.dart';

class WhatsAppChatPage extends StatefulWidget {
  final ChatModel chatModel;
  const WhatsAppChatPage({super.key, required this.chatModel});

  @override
  State<WhatsAppChatPage> createState() => _WhatsAppChatPageState();
}

class _WhatsAppChatPageState extends State<WhatsAppChatPage> {
  @override
  void initState() {
    Get.put(ChatController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColors,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () {
            Get.to(
              () => ChatDetail(
                chatModel: widget.chatModel,
              ),
            );
          },
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back)),
              const SizedBox(
                width: 5,
              ),
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(widget.chatModel.imgurl!),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  widget.chatModel.name.toString(),
                  style: const TextStyle(fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {},
            icon: const Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          PopupMenuButton(
            surfaceTintColor: Colors.white,
            color: Colors.white,
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 1,
                  child: Text('New Group'),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Text('New broadcast'),
                ),
                const PopupMenuItem(
                  value: 3,
                  child: Text('Starred messages'),
                ),
                PopupMenuItem(
                  value: 4,
                  onTap: () {
                    Get.find<ChatController>().chatList.clear();
                  },
                  child: const Text('Clear chat'),
                ),
                const PopupMenuItem(
                  value: 5,
                  child: Text('Settings'),
                ),
              ];
            },
            onSelected: (value) {},
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/bg.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: GetX<ChatController>(
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  // height: MediaQuery.of(context).size.height - 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.chatList.length,
                    itemBuilder: (context, index) {
                      if (controller.chatList[index].isMine) {
                        return MessageTileOwn(
                          message: controller.chatList[index].message,
                        );
                      }
                      return MessageTileOther(
                        message: controller.chatList[index].message,
                      );
                    },
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Card(
                        color: Colors.grey.shade200,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey.shade200,
                          ),
                          child: TextFormField(
                            controller: controller.textController,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                              fillColor: Colors.grey.shade200,
                              prefixIcon: IconButton(
                                icon: const Icon(Icons.emoji_emotions),
                                onPressed: () {},
                              ),
                              hintText: "Message",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  Get.find<HomeController>()
                                      .openCamera(context);
                                },
                                icon: const Icon(
                                  Icons.camera_alt,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColors,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: IconButton(
                          onPressed: () async {
                            controller.sendMessage();
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
