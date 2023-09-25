import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final double top,left,right,bottom,width,height;
  final double radius;
  final String imageUrl;
  const ImageView({Key?key,required this.imageUrl,required this.radius,this.bottom=0.0,this.top=0.0,this.right=0.0,this.left=0.0,this.width=0.0,this.height=0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: left),
      child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(radius)),
          child: Image.network(imageUrl,width: width,height: height,)),
    );
  }
}
