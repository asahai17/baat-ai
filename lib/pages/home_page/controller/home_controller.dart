import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappchat/pages/camera_screen.dart';
import 'package:whatsappchat/pages/home_page/model/call_model.dart';
import 'package:whatsappchat/pages/home_page/model/chat_model.dart';
import 'package:whatsappchat/pages/home_page/model/status_model.dart';
import 'package:whatsappchat/pages/home_page/repository/home_repository.dart';

class HomeController extends GetxController {
  List<ChatModel> usersList = [];

  List<ChatModel> chatList = [];
  List<ChatModel> groupList = [];

  List<StatusModel> statusList = [];
  List<CallModel> callList = [];
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    initialise();
    super.onInit();
  }

  initialise() {
    fetchUsers();
    fetchStatus();
    fetchCalls();
  }

  fetchUsers() async {
    isLoading.value = true;
    usersList = await HomeRepository.instance.getData();
    chatList = usersList.where((element) => element.isGroup == false).toList();
    groupList = usersList.where((element) => element.isGroup == true).toList();
    isLoading.value = false;
  }

  fetchStatus() async {
    isLoading.value = true;
    statusList = await HomeRepository.instance.getStatusData();
    isLoading.value = false;
  }

  fetchCalls() async {
    isLoading.value = true;
    callList = await HomeRepository.instance.getCallData();
    isLoading.value = false;
  }

  filterList(bool value) {
    isLoading.value = true;
    if (value) {
      usersList.where((element) => element.isGroup!);
    } else {
      usersList.where((element) => !element.isGroup!);
    }

    isLoading.value = false;
  }

  Future<void> openCamera(BuildContext context) async {
    try {
      final cameras = await availableCameras();

      final firstCamera = cameras.first;

      final CameraController controller = CameraController(
        firstCamera,
        ResolutionPreset.medium,
      );

      await controller.initialize();

      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CameraScreen(controller: controller),
        ),
      );
    } catch (e) {
      log('Error opening camera: $e');
    }
  }
}
