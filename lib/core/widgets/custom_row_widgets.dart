import 'package:app/src/main_index.dart';

class CustomRowWidgets extends StatelessWidget {
  final Widget firstWidget;
  final Widget secondWidget;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final EdgeInsetsDirectional? padding;

  const CustomRowWidgets({
    super.key,
    required this.firstWidget,
    required this.secondWidget,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: [
          firstWidget,
          secondWidget,
        ],
      ),
    );
  }
}
