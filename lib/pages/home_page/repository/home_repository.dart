import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:whatsappchat/pages/home_page/model/call_model.dart';
import 'package:whatsappchat/pages/home_page/model/chat_model.dart';
import 'package:whatsappchat/pages/home_page/model/status_model.dart';

class HomeRepository {
  HomeRepository._();
  static final HomeRepository instance = HomeRepository._();

  Future<List<ChatModel>> getData() async {
    try {
      var data = await rootBundle.loadString('assets/chats.json');

      final Map<String, dynamic> jsonData = json.decode(data);
      final List<dynamic> jsonList = jsonData['chats'];

      List<ChatModel> chats =
          jsonList.map((json) => ChatModel.fromJson(json)).toList();

      return chats;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<StatusModel>> getStatusData() async {
    try {
      var data = await rootBundle.loadString('assets/status.json');

      final Map<String, dynamic> jsonData = json.decode(data);
      final List<dynamic> jsonList = jsonData['status'];

      List<StatusModel> status =
          jsonList.map((json) => StatusModel.fromJson(json)).toList();

      return status;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<CallModel>> getCallData() async {
    try {
      var data = await rootBundle.loadString('assets/call_list.json');

      final Map<String, dynamic> jsonData = json.decode(data);
      final List<dynamic> jsonList = jsonData['calls'];

      List<CallModel> callList =
          jsonList.map((json) => CallModel.fromJson(json)).toList();

      return callList;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
