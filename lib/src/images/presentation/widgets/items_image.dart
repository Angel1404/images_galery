import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../src.dart';

class ItemsImages extends StatelessWidget {
  const ItemsImages({
    super.key,
    required this.image,
  });

  final ImageResponse image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: CachedNetworkImage(
        imageUrl: image.urls.full,
        fit: BoxFit.cover,
        placeholder: (context, url) => Image.asset(
          "assets/loading_image.gif",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
