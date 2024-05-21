import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DefaultCachedNetworkImage extends StatelessWidget {
  const DefaultCachedNetworkImage({
    super.key,
    this.url,
    required this.width,
    required this.height,
  });

  final String? url;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (_) {
      if (url == null) {
        return DefaultEmptyProviderCover(
          width: width,
          height: height,
        );
      }

      return CachedNetworkImage(
        imageUrl: url!,
        width: width,
        height: height,
        fit: BoxFit.cover,
        placeholder: (_, __) => DefaultEmptyProviderCover(
          width: width,
          height: height,
        ),
        errorWidget: (_, __, ___) => DefaultEmptyProviderCover(
          width: width,
          height: height,
        ),
      );
    });
  }
}

class DefaultEmptyProviderCover extends StatelessWidget {
  const DefaultEmptyProviderCover({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[200],
      child: const Icon(Icons.image),
    );
  }
}
