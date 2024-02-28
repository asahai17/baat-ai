import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:whatsappchat/pages/home_page/controller/home_controller.dart';
import 'package:whatsappchat/pages/home_page/views/tabs/chat_page/chat_tile.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

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
                itemCount: controller.groupList.length,
                itemBuilder: (context, index) {
                  return ChatTile(
                    chatModel: controller.groupList[index],
                  );
                },
              );
      },
    );
  }
}
