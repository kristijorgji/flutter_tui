import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SizedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final Size size;
  final BoxFit fit;

  const SizedNetworkImage({
    Key? key,
    required this.imageUrl,
    this.size = Size.infinite,
    this.fit = BoxFit.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, imageUrl) => Container(
          color: Theme.of(context).backgroundColor,
          width: size.width,
          height: size.height,
        ),
        fit: fit,
        width: size.width,
        height: size.height,
      );
}
