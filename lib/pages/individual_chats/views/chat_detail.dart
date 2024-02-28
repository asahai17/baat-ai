import 'package:flutter/material.dart';
import 'package:whatsappchat/constant/app_constant.dart';
import 'package:whatsappchat/pages/home_page/model/chat_model.dart';
import 'package:whatsappchat/pages/individual_chats/views/components/about_widget.dart';
import 'package:whatsappchat/pages/individual_chats/views/components/group_display_widget.dart';
import 'package:whatsappchat/pages/individual_chats/views/components/heading_widget.dart';
import 'package:whatsappchat/pages/individual_chats/views/components/media_display_widget.dart';
import 'package:whatsappchat/pages/individual_chats/views/components/settings_widget.dart';

class ChatDetail extends StatelessWidget {
  final ChatModel chatModel;
  const ChatDetail({super.key, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.grey.shade300,
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 4,
                ),
                HeadingWidget(chatModel: chatModel),
                const AboutWidget(),
                const MediaWidget(),
                SettingsWidget(
                  list: localSetting,
                  isSetting: true,
                ),
                SettingsWidget(
                  list: dynamicSetting,
                  isSetting: true,
                ),
                const GroupDisplayWidget(),
                SettingsWidget(
                  list: blockReportList,
                  isSetting: false,
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
