import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappchat/constant/app_colors.dart';
import 'package:whatsappchat/pages/home_page/controller/home_controller.dart';
import 'package:whatsappchat/pages/home_page/views/tabs/call_page.dart/call_listing.dart';
import 'package:whatsappchat/pages/home_page/views/tabs/chat_page/chats_listing_screen.dart';
import 'package:whatsappchat/pages/home_page/views/tabs/groups/group_page.dart';
import 'package:whatsappchat/pages/home_page/views/tabs/status_page/status_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColors,
            foregroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: const Text("Whatsapp"),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.camera_enhance_rounded,
                ),
                onPressed: () {
                  Get.find<HomeController>().openCamera(context);
                },
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
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
                      value: 2,
                      child: Text('Linked devices'),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Text('Starred messages'),
                    ),
                    PopupMenuItem(
                      value: 2,
                      onTap: () {
                        Get.find<HomeController>().initialise();
                      },
                      child: const Text('Refresh'),
                    ),
                    PopupMenuItem(
                      onTap: () {},
                      value: 2,
                      child: const Text('LogOut'),
                    ),
                  ];
                },
              )
            ],
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Column(
                children: [
                  TabBar(
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    labelColor: Colors.white,
                    indicatorColor: Colors.white,
                    indicatorWeight: 4,
                    unselectedLabelColor: Colors.white60,
                    unselectedLabelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    tabs: [
                      Tab(
                        text: "Chats",
                      ),
                      Tab(
                        text: 'Groups',
                      ),
                      Tab(
                        text: "Status",
                      ),
                      Tab(
                        text: "Calls",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              ChatListingScreen(),
              GroupPage(),
              StatusPage(),
              CallListPage(),
            ],
          ),
        ),
      ),
    );
  }
}
