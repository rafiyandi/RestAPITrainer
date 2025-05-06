import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanberapp66/config/style/app_color.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    super.key,
    required this.title,
    this.color,
    this.textColor,
    this.side,
    this.onPressed,
  });
  final String title;
  final Color? color;
  final Color? textColor;
  final BorderSide? side;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            side: side,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: color ?? primaryColor),
        onPressed: onPressed,
        child: Text(
          title,
          style: GoogleFonts.arimo(
            color: textColor ?? whiteColor,
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
