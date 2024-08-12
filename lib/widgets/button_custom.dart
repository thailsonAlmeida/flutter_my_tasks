import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? colorFont;
  final double? width;
  final double? heith;
  final double? fontSize;
  final Function()? onTap;

  const ButtonCustom({
    super.key,
    this.width = 130,
    this.heith = 55,
    this.onTap,
    required this.text,
    this.color = Colors.black,
    this.colorFont = Colors.white,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      elevation: 1,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 130,
          height: 55,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: colorFont, fontSize: fontSize),
            ),
          ),
        ),
      ),
    );
  }
}
