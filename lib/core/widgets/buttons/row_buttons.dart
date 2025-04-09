import 'package:app/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:app/core/widgets/buttons/primary_button.dart';

class RowButtons extends StatelessWidget {
  final String? title1;
  final String? title2;
  final Function()? onPressed1;
  final Function()? onPressed2;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final Color? backgroundColor2;
  const RowButtons({Key? key, this.title1, this.title2, this.onPressed1, this.onPressed2, this.margin, this.padding, this.height, this.backgroundColor2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Row(
        children: [
          if(onPressed1 != null)
          Expanded(
            child: PrimaryButton(
              title: title1,
              height: height ?? 35,
              backgroundColor: context.primaryColor,
              radius: 15,
              onPressed: onPressed1,
              padding: padding ?? EdgeInsets.zero,
            ),
          ),
          if(onPressed2 != null)
          Expanded(
            child: PrimaryButton(
              title: title2,
              height: height ?? 35,
              margin: 10.paddingStart,
              backgroundColor: backgroundColor2 ?? theme.colorScheme.errorContainer,
              radius: 15,
              onPressed: onPressed2,
              padding: padding ?? EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}
