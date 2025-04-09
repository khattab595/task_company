import 'package:app/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/decorations/decorations.dart';

class SettingsContainer extends StatelessWidget {
  final Widget? child;
  final Decoration? decoration;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  const SettingsContainer({Key? key, this.child, this.decoration, this.margin, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      margin: margin ?? 16.paddingAll,
      padding: padding ?? 16.paddingAll,
      decoration: decoration ?? Decorations.shapeDecorationShadow(
        color: const Color(0xfff7f6f6),
        colorShadow: const Color(0x29000000),
        radius: 15,
      ),
      child: child,
    );
  }
}
