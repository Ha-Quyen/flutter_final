import 'package:flutter/material.dart';
import 'package:flutter_final/configs/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.text,
    required this.press,
    required this.height,
    required this.width,
    this.radius,
    this.backgroundColor,
    this.textColor,
    this.textSize,
  });

  final String text;
  final VoidCallback press;
  final double height;
  final double width;
  final double? radius;
  final Color? backgroundColor;
  final Color? textColor;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: SizeConfig.getProportionateScreenWidth(height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 0.0)),
        color: backgroundColor ?? const Color(0x00000000),
      ),
      child: TextButton(
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
              fontSize: SizeConfig.getProportionateScreenWidth(textSize ?? 20),
              color: textColor ?? const Color(0x00ffffff)),
        ),
      ),
    );
  }
}
