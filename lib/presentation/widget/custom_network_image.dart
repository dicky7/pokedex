
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? radius;

  const CustomNetworkImage({
    Key? key,
    required this.imageUrl,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: radius,
      errorWidget: (context, url, error) => SizedBox(),
      fit: BoxFit.contain,
    );
  }
}