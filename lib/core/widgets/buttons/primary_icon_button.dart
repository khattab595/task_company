import 'package:app/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../decorations/decorations.dart';
import 'app_icon.dart';

class PrimaryIconButton extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final Function()? onPressed;
  final double? height;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final String icon;
  final Color? iconColor;
  final Decoration? decoration;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const PrimaryIconButton(
      {Key? key,
      this.title,
      this.onPressed,
      this.height,
      this.backgroundColor,
      this.borderRadius,
      required this.icon,
      this.iconColor,
      this.titleStyle,
      this.decoration,
      this.margin,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      margin: margin,
      decoration: decoration ??
          Decorations.kDecorationOnlyRadius(
              color: backgroundColor ?? theme.primaryColor, radius: 8),
      child: InkWell(
        onTap: onPressed,
        radius: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppIcon(
                icon: icon, color: iconColor ?? context.cardColor, size: 25),
            10.pw,
            Text(
              title!,
              style: titleStyle ?? context.labelSmall.copyWith(fontSize: 16)
            ),
          ],
        ),
      ),
    );
  }
}
