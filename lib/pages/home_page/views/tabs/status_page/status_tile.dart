import 'package:flutter/material.dart';
import 'package:whatsappchat/pages/home_page/model/status_model.dart';

class StatusTile extends StatelessWidget {
  final StatusModel statusModel;
  const StatusTile({super.key, required this.statusModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(
          "${statusModel.imgurl}",
        ),
      ),
      title: Text(
        statusModel.name!,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
      subtitle: const Text(
        "Just now",
        style: TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
