import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double? height;
  final Color? color;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  const CustomDivider({Key? key, this.height, this.color, this.thickness, this.indent, this.endIndent, this.margin, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return  Container(
      color: backgroundColor ?? theme.colorScheme.surface,
      margin: margin ?? EdgeInsets.zero,
      child: Divider(
        height: height,
        thickness: 1,
        indent: indent ?? 16,
        endIndent: endIndent ?? 16,
      ),
    );
  }
}
