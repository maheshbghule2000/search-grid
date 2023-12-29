import 'package:flutter/material.dart';
import 'package:search_grid/constants/colors.dart';
import 'package:search_grid/constants/strings.dart';
import 'package:search_grid/themes/app_utils.dart';

import '../themes/app_sizes.dart';

class TextWidget extends StatelessWidget {
  
  final String data;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign textAlign;
  final Color? color;
  final bool isMandatory;
  final double? height;
  final TextOverflow textOverflow;
  final double? textScaleFactor;
  final int? maxLines;
  final bool? trimLongText;

  TextWidget({
    Key? key,
    required this.data,
    this.fontWeight = FontWeight.normal,
    this.fontSize = AppSizes.smallTextSize, // =15
    this.textAlign = TextAlign.start,
    this.color,
    this.isMandatory = false,
    this.trimLongText,
    this.height,
    this.textOverflow = TextOverflow.clip,
    this.textScaleFactor,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: trimLongText == true ? data : "",
      child: RichText(
        maxLines: maxLines ?? 1,
        textAlign: textAlign,
        overflow: textOverflow,
        textScaleFactor: textScaleFactor ?? 1,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: trimLongText == true ? data.truncateTo(50) : data,
              style: TextStyle(
                fontFamily: kFontFamily,
                color: color,
                fontWeight: fontWeight,
                fontSize: AppSizes.getPhoneSize(fontSize),
                height:
                    height != null ? AppSizes.getPhoneSize(height!) : height,
              ),
            ),
            isMandatory
                ? TextSpan(
                    text: " *",
                    style: TextStyle(
                      fontFamily: kFontFamily,
                      color: kPrimaryLightTextColor,
                      fontWeight: fontWeight,
                      fontSize: AppSizes.getPhoneSize(fontSize),
                      height: height != null
                          ? AppSizes.getPhoneSize(height!)
                          : height,
                    ),
                  )
                : const TextSpan(),
          ],
        ),
      ),
    );
  }
}
