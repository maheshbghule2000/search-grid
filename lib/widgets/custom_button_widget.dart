
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../themes/style.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool disabled;
  final bool busy;
  final void Function()? onTap;
  final bool outline;
  final Widget? leading;
  final double width;
  final double height;
  final double radius;
  final double? fontSize;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final bool capitalize;
  final LinearGradient? gradiant;
  final EdgeInsets? padding;

  const CustomButtonWidget({
    Key? key,
    required this.title,
    this.disabled = false,
    this.busy = false,
    this.onTap,
    this.subtitle,
    this.padding,
    this.leading,
    this.width = 300,
    this.height = 55,
    this.radius = 60.0,
    this.fontSize = 16.0,
    this.backgroundColor = kcPrimaryDarkOrangeColor,
    this.textColor = kcWhiteColor,
    this.borderColor = kcPrimaryDarkOrangeColor,
    this.capitalize = true,
    this.gradiant,
  })  : outline = false,
        super(key: key);

  const CustomButtonWidget.outline({
    required this.title,
    this.onTap,
    this.subtitle,
    this.leading,
    this.padding,
    this.width = 300,
    this.height = 55,
    this.radius = 30.0,
    this.fontSize = 16.0,
    this.backgroundColor = kcPrimaryDarkOrangeColor,
    this.textColor = kcWhiteColor,
    this.borderColor = kcPrimaryDarkOrangeColor,
    this.capitalize = true,
    this.gradiant,
  })  : disabled = false,
        busy = false,
        outline = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled || busy ? null : onTap,
      child: Container(
        padding: padding,
        width: double.infinity,
        height: height,
        alignment: Alignment.center,
        decoration: !outline
            ? BoxDecoration(
                color: !disabled ? backgroundColor : kcMediumGray1Color,
                borderRadius: BorderRadius.circular(radius),
                gradient: !disabled ? gradiant : null,
              )
            : BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(
                  color: borderColor,
                  width: 1,
                )),
        child: busy
            ? const CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leading != null) leading!,
                  if (leading != null) SizedBox(width: 5),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: bodyStyle.copyWith(
                        fontWeight:
                            !outline ? FontWeight.bold : FontWeight.w400,
                        color: textColor,
                        fontSize: fontSize,
                      ),
                    ),
                  if (subtitle != null) Spacer(),
                  Text(
                    capitalize ? title.toUpperCase() : title,
                    style: bodyStyle.copyWith(
                      fontWeight: !outline ? FontWeight.bold : FontWeight.w400,
                      color: textColor,
                      fontSize: fontSize,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}