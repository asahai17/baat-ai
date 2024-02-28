import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappchat/pages/home_page/controller/home_controller.dart';
import 'package:whatsappchat/pages/home_page/views/tabs/call_page.dart/call_tile.dart';

class CallListPage extends StatelessWidget {
  const CallListPage({super.key});

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
                itemCount: controller.callList.length,
                itemBuilder: (context, index) {
                  return CallTile(
                    callModel: controller.callList[index],
                  );
                },
              );
      },
    );
  }
}
