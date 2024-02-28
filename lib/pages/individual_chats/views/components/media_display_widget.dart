import 'package:flutter/material.dart';

class MediaWidget extends StatelessWidget {
  const MediaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      padding: const EdgeInsets.only(bottom: 10, top: 5, left: 20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Media, links and docs',
                style: TextStyle(fontSize: 16),
              ),
              Row(
                children: [
                  Text(
                    '7',
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              const MediaDisplayWidget(
                imgUrl: 'assets/peakpx.jpg',
              ),
              const SizedBox(
                width: 5,
              ),
              const MediaDisplayWidget(
                imgUrl: 'assets/phoenix.jpg',
              ),
              const SizedBox(
                width: 5,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey.shade200,
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '5',
                      ),
                      Icon(
                        Icons.add,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class MediaDisplayWidget extends StatelessWidget {
  final String imgUrl;
  const MediaDisplayWidget({
    super.key,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        image: DecorationImage(
          image: AssetImage(
            imgUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
