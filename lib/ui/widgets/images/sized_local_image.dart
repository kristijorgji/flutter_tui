import 'package:flutter/material.dart';

class SizedLocalImage extends StatelessWidget {
  final String assetName;
  final Size size;
  final BoxFit fit;

  const SizedLocalImage({
    Key? key,
    required this.assetName,
    this.size = Size.infinite,
    this.fit = BoxFit.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/$assetName'),
            fit: fit,
          ),
        ),
      );
}
