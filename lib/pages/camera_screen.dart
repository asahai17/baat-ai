import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatelessWidget {
  final CameraController controller;

  const CameraScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CameraPreview(
      controller,
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          alignment: Alignment.center,
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 3),
              borderRadius: BorderRadius.circular(60)),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(color: Colors.grey, width: 3),
                  borderRadius: BorderRadius.circular(60)),
            ),
          ),
        ),
      ),
    );
  }
}
