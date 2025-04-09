import 'package:app/core/widgets/texts/texts.dart';
import 'package:flutter/material.dart';


class RowTexts extends StatelessWidget {
  final String title;
  final String value;
  final Color? titleColor;
  final Color? valueColor;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final StrutStyle? titleStrutStyle;
  final StrutStyle? valueStrutStyle;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final bool? isSizedBox;
  final EdgeInsetsGeometry? padding;

  const RowTexts({
    Key? key,
    required this.title,
    required this.value,
    this.titleStyle,
    this.valueStyle,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.titleStrutStyle,
    this.valueStrutStyle,
    this.isSizedBox = true,
    this.padding,
    this.titleColor,
    this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Row(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
        children: [
          SemiBoldText(label: title, labelStyle: titleStyle, fontSize: 14),
          RegularText(
            labelStyle: valueStyle ,
            label: value,
            fontSize: 14,
          ),
        ],
      ),
    );
  }
}
