import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../components/base_stateless_widget.dart';
import '../../decorations/decorations.dart';
import '../../resources/validation.dart';

class CustomPinCode extends BaseStatelessWidget {
  final int length;
  final TextEditingController pinCodeController;
   CustomPinCode({Key? key, this.length = 4, required this.pinCodeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: headlineLarge,
      decoration: Decorations.kDecorationBorderRadius(),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: primaryColor),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        submittedPinTheme: submittedPinTheme,
        length: length,
        validator: (value) => Validation.validateRequired(value ?? ''),
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        showCursor: true,
        controller: pinCodeController,
        errorTextStyle: displaySmall.copyWith(color: Colors.red),
      ),
    );
  }
}
