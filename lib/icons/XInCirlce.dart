import 'package:flutter/material.dart';

class XInCirlce extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color iconColor;
  final Color fillColor;

  const XInCirlce(
      {Key? key,
      required this.onPressed,
      required this.iconColor,
      required this.fillColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: CircleAvatar(
        radius: 20.0,
        backgroundColor: fillColor,
        child: Icon(Icons.close, color: iconColor),
      ),
      shape: const CircleBorder(),
      elevation: 1.0,
      fillColor: fillColor,
      padding: const EdgeInsets.all(2),
    );
  }
}
