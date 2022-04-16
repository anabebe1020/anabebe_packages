import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? boxFit;

  const GeneralNetworkImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.boxFit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? CachedNetworkImage(
            imageUrl: imageUrl ?? "",
            height: height,
            width: width,
            fit: boxFit ?? BoxFit.cover,
            errorWidget: (_, __, ___) => Image.asset(
              "../assets/noimage.png",
              width: width,
              height: height,
              fit: boxFit ?? BoxFit.cover,
            ),
          )
        : Image.asset(
            "../assets/noimage.png",
            width: width,
            height: height,
            fit: boxFit ?? BoxFit.cover,
          );
  }
}
