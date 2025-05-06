import 'package:flutter/material.dart';

class CustomBoxImageAsset extends StatelessWidget {
  const CustomBoxImageAsset({
    super.key,
    required this.urlImage,
    this.width,
    this.height,
    this.margin,
  });
  final String urlImage;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height ?? 40,
      width: width ?? 40,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(urlImage), fit: BoxFit.cover),
      ),
    );
  }
}
