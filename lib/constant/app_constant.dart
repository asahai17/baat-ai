import 'package:flutter/material.dart';

class AppConstant {
  static const double chatDetailSpacing = 8;
}

class SettingModel {
  String? description;
  final String title;
  final IconData icon;

  SettingModel({
    this.description,
    required this.title,
    required this.icon,
  });
}

List<SettingModel> localSetting = [
  SettingModel(
    title: 'Mute notification',
    icon: Icons.notifications_off,
  ),
  SettingModel(
    title: "Custom notifications",
    icon: Icons.music_note,
  ),
  SettingModel(
    title: "Media visibility",
    icon: Icons.image,
  ),
];
List<SettingModel> dynamicSetting = [
  SettingModel(
    title: 'Encryption',
    icon: Icons.lock,
    description: "Messages and calls are end-to-end encrypted. Tap to verify.",
  ),
  SettingModel(
    title: "Disappearing messages",
    icon: Icons.av_timer,
    description: "Off",
  ),
  SettingModel(
    title: "Chat lock",
    icon: Icons.mail_lock,
    description: "Lock and hide this chat on this device.",
  ),
];

List<SettingModel> blockReportList = [
  SettingModel(
    title: "Block",
    icon: Icons.block,
  ),
  SettingModel(
    title: "Report",
    icon: Icons.thumb_down,
  ),
];
