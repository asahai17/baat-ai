import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappchat/constant/app_colors.dart';
import 'package:whatsappchat/pages/home_page/controller/home_controller.dart';
import 'package:whatsappchat/pages/home_page/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.accentColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(
        () {
          Get.put(
            HomeController(),
          );
        },
      ),
      home: const HomePage(),
    );
  }
}
