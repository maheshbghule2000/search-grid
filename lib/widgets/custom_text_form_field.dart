import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:search_grid/constants/colors.dart';
import 'package:stacked/stacked.dart';

import '../themes/style.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String placeholder;
  final bool readOnly;
  final String? label;
  final TextStyle? labelStyle;
  final Widget? leading;
  final Widget? trailing;
  final bool password;
  final bool enabled;
  final bool righSideNoBorder;
  final bool leftSideNoBorder;
  final bool circularBoder;
  final TextStyle? textStyle;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final int maxLength;
  final int minLines;
  final int maxLines;
  final Color borderColor;
  final Color enabledBorderColor;
  final Color errorBorderColor;
  final Color focusedBorderColor;
  final Color fillColor;
  final Color? CursorColor;
  void Function(String)? onSubmitted;
  final String? hintText;
  final bool skeletonLoading;
  final void Function()? onTap;
  final void Function()? trailingTapped;
  final TextCapitalization textCapitalization;
  final bool onlyBottomBorder;
  final List<TextInputFormatter> additionalInputFormatters;
  final Function(String)? onChange;
  String? Function(String?)? validator;
  final Color textColor;
  final FocusNode? focusNode;

  final noBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(0),
  );

  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  );

  final rightCircularBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(8),
      bottomRight: Radius.circular(8),
    ),
  );

  final leftCircularBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8),
      bottomLeft: Radius.circular(8),
    ),
  );

  final bottomUnderlineBorder = UnderlineInputBorder();

  CustomTextFormField({
    Key? key,
    this.readOnly = false,
    this.controller,
    this.placeholder = '',
    this.leading,
    this.trailing,
    this.password = false,
    this.trailingTapped,
    this.enabled = true,
    this.righSideNoBorder = false,
    this.leftSideNoBorder = false,
    this.keyboardType = TextInputType.text,
    this.textStyle,
    this.maxLength = 250,
    this.textAlign = TextAlign.left,
    this.borderColor = kcGray2Color,
    this.enabledBorderColor = kcGray2Color,
    this.errorBorderColor = Colors.red,
    this.focusedBorderColor = kcPrimaryGreenColor,
    this.label,
    this.labelStyle,
    this.onTap,
    this.fillColor = Colors.white,
    this.circularBoder = true,
    this.minLines = 1,
    this.maxLines = 1,
    this.skeletonLoading = false,
    this.textCapitalization = TextCapitalization.sentences,
    this.onlyBottomBorder = false,
    this.additionalInputFormatters = const [],
    this.onChange,
    this.textColor = kcDarkGray2Color,
    this.focusNode,
    this.hintText,
    this.validator,
    this.onSubmitted,
    this.CursorColor = kcPrimaryGreenColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 9.0),
            child: Text(
              label!,
              style: labelStyle,
            ),
          ),
        SkeletonLoader(
          loading: skeletonLoading,
          child: TextFormField(
            focusNode: focusNode,
            controller: controller,
            cursorColor: CursorColor,
            style: textStyle?.copyWith(color: textColor),
            validator: validator,
            readOnly: readOnly,
            enabled: enabled,
            obscureText: password,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            maxLength: maxLength,
            textAlign: textAlign,
            onTap: onTap,
            maxLines: maxLines,
            onChanged: onChange,
            onFieldSubmitted: onSubmitted,
            inputFormatters: [...additionalInputFormatters],
            decoration: onlyBottomBorder
                ? InputDecoration(
                    hintText: hintText,
                    counterText: '',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 19, horizontal: 10),
                    filled: true,
                  
                    fillColor: fillColor,
                    prefixIcon: leading,
                    suffixIcon: trailing != null
                        ? GestureDetector(
                            onTap: trailingTapped,
                            child: trailing,
                          )
                        : null,
                    border: bottomUnderlineBorder.copyWith(
                      borderSide: BorderSide(color: borderColor),
                    ),
                    errorBorder: bottomUnderlineBorder.copyWith(
                      borderSide: BorderSide(color: errorBorderColor),
                    ),
                    focusedBorder: bottomUnderlineBorder.copyWith(
                      borderSide: BorderSide(color: focusedBorderColor),
                    ),
                    enabledBorder: bottomUnderlineBorder.copyWith(
                      borderSide: BorderSide(color: enabledBorderColor),
                    ),
                  )
                : righSideNoBorder
                    ? InputDecoration(
                        hintText: hintText,
                        counterText: '',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 19, horizontal: 10),
                        filled: true,
                        fillColor: fillColor,
                        prefixIcon: leading,
                        suffixIcon: trailing != null
                            ? GestureDetector(
                                onTap: trailingTapped,
                                child: trailing,
                              )
                            : null,
                        border: leftCircularBorder.copyWith(
                          borderSide: BorderSide(color: borderColor),
                        ),
                        errorBorder: leftCircularBorder.copyWith(
                          borderSide: BorderSide(color: errorBorderColor),
                        ),
                        focusedBorder: leftCircularBorder.copyWith(
                          borderSide: BorderSide(color: focusedBorderColor),
                        ),
                        enabledBorder: leftCircularBorder.copyWith(
                          borderSide: BorderSide(color: enabledBorderColor),
                        ),
                      )
                    : leftSideNoBorder
                        ? InputDecoration(
                            hintText: hintText,
                            counterText: '',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 19, horizontal: 10),
                            filled: true,
                            fillColor: fillColor,
                            prefixIcon: leading,
                            suffixIcon: trailing != null
                                ? GestureDetector(
                                    onTap: trailingTapped,
                                    child: trailing,
                                  )
                                : null,
                            border: rightCircularBorder.copyWith(
                              borderSide: BorderSide(color: borderColor),
                            ),
                            errorBorder: rightCircularBorder.copyWith(
                              borderSide: BorderSide(color: errorBorderColor),
                            ),
                            focusedBorder: rightCircularBorder.copyWith(
                              borderSide: BorderSide(color: focusedBorderColor),
                            ),
                            enabledBorder: rightCircularBorder.copyWith(
                              borderSide: BorderSide(color: enabledBorderColor),
                            ),
                          )
                        : circularBoder
                            ? InputDecoration(
                                hintText: hintText,
                                hintStyle: bodyStyle.copyWith(
                                  color: kcMediumGray2Color,
                                  fontSize: 14,
                                ),
                                counterText: '',
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 19, horizontal: 10),
                                filled: true,
                                fillColor: fillColor,
                                prefixIcon: leading,
                                suffixIcon: trailing != null
                                    ? GestureDetector(
                                        onTap: trailingTapped,
                                        child: trailing,
                                      )
                                    : null,
                                border: circularBorder.copyWith(
                                  borderSide: BorderSide(color: borderColor),
                                ),
                                errorBorder: circularBorder.copyWith(
                                  borderSide:
                                      BorderSide(color: errorBorderColor),
                                ),
                                focusedBorder: circularBorder.copyWith(
                                  borderSide:
                                      BorderSide(color: focusedBorderColor),
                                ),
                                enabledBorder: circularBorder.copyWith(
                                  borderSide:
                                      BorderSide(color: enabledBorderColor),
                                ),
                              )
                            : InputDecoration(
                                hintText: hintText,
                                counterText: '',
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 19, horizontal: 10),
                                filled: true,
                                fillColor: fillColor,
                                prefixIcon: leading,
                                suffixIcon: trailing != null
                                    ? GestureDetector(
                                        onTap: trailingTapped,
                                        child: trailing,
                                      )
                                    : null,
                                border: noBorder.copyWith(
                                  borderSide: BorderSide(color: borderColor),
                                ),
                                errorBorder: noBorder.copyWith(
                                  borderSide:
                                      BorderSide(color: errorBorderColor),
                                ),
                                focusedBorder: noBorder.copyWith(
                                  borderSide:
                                      BorderSide(color: focusedBorderColor),
                                ),
                                enabledBorder: noBorder.copyWith(
                                  borderSide:
                                      BorderSide(color: enabledBorderColor),
                                ),
                              ),
          ),
        ),
      ],
    );
  }
}
