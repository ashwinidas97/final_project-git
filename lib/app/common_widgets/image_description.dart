import 'package:flutter/material.dart';

class ImageDescription extends StatelessWidget {
  final double left, radius, width, height;
  final String postImage;
  final BoxFit boxFit;

  const ImageDescription({
    Key? key,
    required this.left,
    required this.radius,
    required this.width,
    required this.height,
    required this.postImage,
    this.boxFit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          child: Image.network(
            postImage, // Removed the null check here
            height: height,
            width: width,
            fit: boxFit,
          ),
        ),
      ),
    );
  }
}
