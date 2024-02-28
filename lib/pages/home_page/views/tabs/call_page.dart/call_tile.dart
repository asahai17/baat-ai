import 'package:flutter/material.dart';
import 'package:whatsappchat/constant/app_colors.dart';
import 'package:whatsappchat/pages/home_page/model/call_model.dart';

class CallTile extends StatelessWidget {
  final CallModel callModel;
  const CallTile({
    super.key,
    required this.callModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(
          callModel.image!,
        ),
      ),
      title: Text(
        callModel.name.toString(),
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
      subtitle: Row(
        children: [
          callModel.callDirection! == 'in'
              ? const Icon(
                  Icons.call_received_outlined,
                  color: AppColors.colorgreen,
                  size: 16,
                )
              : const Icon(
                  Icons.call_made,
                  size: 16,
                  color: AppColors.colorred,
                ),
          Text(
            callModel.callTime.toString(),
            style: const TextStyle(
                color: Colors.black38, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      trailing: const Icon(
        Icons.phone,
        color: AppColors.colorgreen,
      ),
    );
  }
}
