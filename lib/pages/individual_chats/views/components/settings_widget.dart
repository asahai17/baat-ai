import 'package:flutter/material.dart';
import 'package:whatsappchat/constant/app_colors.dart';
import 'package:whatsappchat/constant/app_constant.dart';

class SettingsWidget extends StatelessWidget {
  final List<SettingModel> list;
  final bool isSetting;
  const SettingsWidget({
    super.key,
    required this.list,
    required this.isSetting,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      color: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              list[index].icon,
              color: isSetting ? Colors.black : AppColors.colorred,
            ),
            title: Text(
              list[index].title,
              style: TextStyle(
                color: isSetting ? Colors.black : AppColors.colorred,
              ),
            ),
            subtitle: list[index].description != null
                ? Text(list[index].description!)
                : null,
          );
        },
      ),
    );
  }
}
