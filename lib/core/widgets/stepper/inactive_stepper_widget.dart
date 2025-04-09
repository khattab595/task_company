import 'package:app/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

///  Created by harbey on 5/21/2023.
class InActiveStepperWidget extends StatelessWidget {
  const InActiveStepperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: 3.paddingBottom,
      padding: 10.paddingAll,
     decoration: BoxDecoration(
        color: theme.hintColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(
        Icons.close,
        color: theme.colorScheme.onPrimary,
        size: 20,
      ),
    );
  }
}
