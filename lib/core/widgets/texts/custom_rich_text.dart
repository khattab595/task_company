import '../../../src/main_index.dart';
import 'package:flutter/gestures.dart';

class CustomRichText extends StatelessWidget {
  final String label;
  final String value;
  final TextAlign textAlign;
  final TextStyle? labelStyle;
  final Color? labelColor;
  final Color? valueColor;
  final TextStyle? valueStyle;
  final Function()? valueOnTap;

  const CustomRichText({
    Key? key,
    required this.label,
    required this.value,
    this.textAlign = TextAlign.center,
    this.labelStyle,
    this.valueStyle,
    this.labelColor,
    this.valueColor,
    this.valueOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label ',
            style: labelStyle ??
                context.textTheme.bodyLarge!.copyWith(
                  color: labelColor,
                  fontSize: 14,
                ),
          ),
          TextSpan(
            text: value,
            style: valueStyle ??
                context.textTheme.bodyLarge!.copyWith(
                  color: valueColor,
                  fontSize: 14,
                ),
            recognizer: TapGestureRecognizer()..onTap = valueOnTap,
          ),
        ],
      ),
    );
  }
}
