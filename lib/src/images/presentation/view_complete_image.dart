import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CompleteViewImage extends StatelessWidget {
  const CompleteViewImage({super.key, required this.imageUrl, required this.id});
  final String imageUrl;
  final String id;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned.fill(
              child: Hero(
                tag: id,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Image.asset(
                    "assets/loading_image.gif",
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10,
              child: SafeArea(
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black45,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
