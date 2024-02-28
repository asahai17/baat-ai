import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      color: Colors.white,
      child: const ListTile(
        tileColor: Colors.white,
        title: Text(
          'Hey there I am using whatsapp',
        ),
        subtitle: Text(
          '28 February 2024',
        ),
      ),
    );
  }
}
