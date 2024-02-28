import 'package:flutter/material.dart';

class MessageTileOwn extends StatelessWidget {
  final String message;

  const MessageTileOwn({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width *
              0.7, // Adjust the width as needed
        ),
        child: Stack(
          children: [
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: const Color(0xffdcf8c6),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 30,
                  top: 5,
                  bottom: 20,
                ),
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 4,
              right: 16,
              child: Row(
                children: [
                  Text(
                    "12:05 pm",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.done_all,
                    color: Colors.grey[600],
                    size: 18,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
