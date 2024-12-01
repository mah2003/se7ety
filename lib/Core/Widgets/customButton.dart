import 'package:flutter/material.dart';
import 'package:se7ety/Core/Utils/Colors.dart';
import 'package:se7ety/Core/Utils/Text_Style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.radius,
  });
  final String text;
  final Function() onPressed;
  final double? width;
  final double? radius;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 70,
      width: width ?? double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.background,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 15))),
          onPressed: onPressed,
          child: Text(
            text,
            style: getHeadLineTextStyle(color: AppColors.background),
          )),
    );
  }
}
