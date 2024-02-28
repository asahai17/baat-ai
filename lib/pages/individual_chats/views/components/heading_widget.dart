import 'package:flutter/material.dart';
import 'package:whatsappchat/pages/home_page/model/chat_model.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({
    super.key,
    required this.chatModel,
  });

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                  chatModel.imgurl!,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  chatModel.name!,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Text(
                '+91 73979******',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
          PopupMenuButton(
            surfaceTintColor: Colors.white,
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
                  value: 3,
                  child: Text('Starred messages'),
                ),
                const PopupMenuItem(
                  value: 5,
                  child: Text('Settings'),
                ),
              ];
            },
          )
        ],
      ),
    );
  }
}
