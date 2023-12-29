import 'package:flutter/material.dart';
import 'package:search_grid/constants/colors.dart';

import '../themes/style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle headingStyle;
  final Color titleColor;
  final Widget? trailing;
  final Widget? leading;
  final Color? backgroundColor;
  final bool centerTitle;
  final List<Widget>? actions;

  @override
  Size get preferredSize => Size.fromHeight(56.0);

  const CustomAppBar({
    super.key,
    required this.title,
    this.trailing,
    this.leading,
    this.backgroundColor = kPrimaryColor,
    this.headingStyle = appBarTitleStyle,
    this.titleColor = kcWhiteColor,
    this.centerTitle = false,
    this.actions,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 56,
      title: Text(
        title,
        style: headingStyle,
      ),
      leading: leading ??
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.transparent,
            ),
            onPressed: () {},
          ),
      backgroundColor: backgroundColor,
      actions: actions ?? [],
      primary: true,
      centerTitle: centerTitle,
    );
  }
}
