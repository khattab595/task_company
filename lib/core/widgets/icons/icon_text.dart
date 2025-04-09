import 'package:app/core/widgets/images/image_network.dart';
import 'package:app/src/main_index.dart';

class IconText extends StatelessWidget {
  final String text;
  final String? icon;
  final TextStyle? textStyle;
  final double? iconSize;
  final Color? iconColor;
  final Color? textColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool? isExpanded;
  final double? sizedBoxWidth;
  final bool? isIconLift;
  final bool isImage;
  final IconData? iconData;
  final bool isIconData;

  const IconText({
    Key? key,
    required this.text,
    this.icon,
    this.textStyle,
    this.iconSize,
    this.iconColor,
    this.textColor,
    this.fontSize,
    this.padding,
    this.mainAxisAlignment,
    this.isExpanded,
    this.crossAxisAlignment,
    this.sizedBoxWidth,
    this.isIconLift = false,
    this.isImage = false,
    this.iconData,
    this.isIconData = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsetsDirectional.zero,
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: [
          isIconLift ?? false
              ? isExpanded ?? false
                  ? buildExpandedText(context)
                  : buildText(context)
              : buildIconOrImage(context),
          SizedBox(
            width: sizedBoxWidth ?? 8,
          ),
          isIconLift ?? false
              ? buildIconOrImage(context)
              : isExpanded ?? false
                  ? buildExpandedText(context)
                  : buildText(context),
        ],
      ),
    );
  }

  Widget buildText(BuildContext context) => Text(text,
      style: textStyle ??
          context.headlineLarge.copyWith(
            color: textColor,
            fontSize: fontSize ?? 16,
          ));

  Widget buildExpandedText(BuildContext context) => Expanded(
        child: Text(text,
            style: textStyle ??
                context.headlineLarge.copyWith(
                  color: textColor,
                  fontSize: fontSize ?? 16,
                )),
      );

  Widget buildIconOrImage(BuildContext context) => icon
              ?.split('/')
              .last
              .contains('.svg') ??
          false
      ? AppIcon(
          icon: icon ?? '',
          size: iconSize,
          color: iconColor,
        )
      : isIconData
          ? Icon(iconData, size: iconSize, color: iconColor)
          : icon!.contains('http')
              ? ImageNetwork(
                  image: icon ?? '',
                  height: iconSize,
                  width: iconSize,
                  radius: 0,
                )
              : Image.asset(
                  icon ?? '',
                  height: iconSize,
                  width: iconSize,
                  color: iconColor,
                );
}
