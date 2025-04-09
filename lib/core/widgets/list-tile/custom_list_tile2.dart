
import '../../../src/main_index.dart';

class CustomListTile2 extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final String? iconLeading;
  final Color? iconLeadingColor;
  final double? iconLeadingSize;
  final Widget? trailing;
  final Function()? onTap;
  final bool? isArrowForward;
  final EdgeInsetsGeometry? contentPadding;

  const CustomListTile2(
      {Key? key,
      required this.title,
      this.titleStyle,
      this.subtitle,
      this.iconLeading,
      this.iconLeadingColor,
      this.iconLeadingSize,
      this.trailing,
      this.onTap,
      this.isArrowForward,
      this.contentPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: theme.cardColor,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            AppIcon(
                icon: iconLeading ?? AppIcons.clock,
                color: iconLeadingColor ?? theme.primaryColor,
                size: iconLeadingSize ?? 20),
            const SizedBox(width: 14),
            Text(title, style: titleStyle ?? theme.textTheme.headlineLarge!.copyWith(fontSize: 16)),
            const Spacer(),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
