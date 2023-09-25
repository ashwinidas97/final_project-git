import 'package:flutter/material.dart';

class CommonDivider extends StatelessWidget {
  final Color color;
  final double endIndent,indent;
  const CommonDivider({Key?key, required this.color, required this.endIndent, required this.indent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(color: color,endIndent: endIndent,indent:indent,);
  }
}
