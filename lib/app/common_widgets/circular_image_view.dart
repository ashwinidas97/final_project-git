import 'package:flutter/material.dart';

class CircularImageView extends StatelessWidget {
  final double top, bottom, left, right;
  final String pathUrl;
  final double width, height, radius;

  const CircularImageView({
    Key? key,
    this.top = 0,
    this.bottom = 0,
    this.left = 0,
    this.right = 0,
    required this.pathUrl,
    required this.width,
    required this.height,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left),
      child: ClipRRect(
        child: Image.network(
          pathUrl ?? "",
          width: width,
          height: height,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
    );
  }
}

