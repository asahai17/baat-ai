import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappchat/pages/home_page/controller/home_controller.dart';

class GroupDisplayWidget extends StatelessWidget {
  const GroupDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 5, left: 20),
            child: Text(
              ' ${Get.find<HomeController>().groupList.length} Groups Joined in common',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: Get.find<HomeController>().groupList.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      Get.find<HomeController>().groupList[index].imgurl!,
                    ),
                  ),
                  title: Text(
                    Get.find<HomeController>().groupList[index].name.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  subtitle: const Text(
                    'User1, User2, User3, User 4....',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
