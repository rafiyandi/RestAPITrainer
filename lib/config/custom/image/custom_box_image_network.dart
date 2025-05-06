import 'package:flutter/material.dart';

class CustomBoxImageNetwork extends StatelessWidget {
  const CustomBoxImageNetwork({
    super.key,
    required this.urlImage,
    this.width,
    this.height,
    this.margin,
    this.shape,
  });
  final String urlImage;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final BoxShape? shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height ?? 40,
      width: width ?? 40,
      decoration: BoxDecoration(
        shape: shape ?? BoxShape.rectangle,
        image:
            DecorationImage(image: NetworkImage(urlImage), fit: BoxFit.cover),
      ),
    );
  }
}
