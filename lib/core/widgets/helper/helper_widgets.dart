import 'package:app/src/main_index.dart';

import '../animations/slide_animation.dart';


Future showAppModalBottomSheet({
  required BuildContext context,
  bool? isScrollControlled = true,
  required Widget child,
  String? title,
  double? topMargin,
  Widget? titleWidget,
  EdgeInsetsGeometry? padding,
  double? radius,
  Color? backgroundColor,
  bool? isDivider = true,
}) {
  ThemeData theme = Theme.of(context);
  return showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled == true,
      isDismissible: true,
      enableDrag: true,
      constraints: isScrollControlled == true
          ? null
          : const BoxConstraints(maxHeight: 500),
      backgroundColor: Colors.transparent,
      builder: (BuildContext builder) {
        return SlideAnimationWidget(
          child: Container(
            height: double.infinity,
            width: double.infinity,
              decoration: BoxDecoration(
                  color: backgroundColor ?? theme.cardColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius ?? 20.0),
                      topRight: Radius.circular(radius ?? 20.0))),
              margin: isScrollControlled == true
                  ? EdgeInsets.only(top: topMargin ?? 100)
                  : EdgeInsets.zero,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    height: 5,
                    width: 50,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.onSurface,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  if (title != null)
                    Text(
                      title,
                      style: theme.textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                  Expanded(
                    child: Container(
                      color: backgroundColor ?? theme.cardColor,
                      padding: padding ??
                          const EdgeInsetsDirectional.only(
                              start: 16, end: 16, top: 20, bottom: 0),
                      child: child,
                    ),
                  ),
                ],
              )),
        );
      });
}

showAppDialog(
    {
      required BuildContext context,
  required Widget child,
  String? title,
  double? topMargin,
  EdgeInsetsGeometry? padding,
  double? radius,
  Color? backgroundColor,

}) {

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title != null ? Text(title) : null,
          backgroundColor: backgroundColor ?? Theme.of(context).cardColor,
          content: child,
        );
      });
}
