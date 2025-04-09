import 'package:app/core/exceptions/extensions.dart';
import 'package:app/core/utils/date_formatter.dart';
import 'package:flutter/material.dart';

///  Created by harbey on 5/21/2023.
class ActiveStepperWidget extends StatelessWidget {
  final Color? color;
  final Color? colorText;
  final String value;
  const ActiveStepperWidget({Key? key, this.color, required this.value, this.colorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    DateTime date = DateTime.now();

    return Container(
      alignment: AlignmentDirectional.center,
      margin: 3.paddingBottom,
      padding: 5.paddingAll,
      decoration: BoxDecoration(
        color: color ?? theme.primaryColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: value.isNotEmpty ?
      Text(
        DateFormatter.formatOrderStatusDateString(value) ?? '',
        textAlign: TextAlign.center,
        style: context.headlineSmall.copyWith(
          color: colorText,
          fontSize: 12,
        )
      ) : 0.ph,
    );
  }
}
