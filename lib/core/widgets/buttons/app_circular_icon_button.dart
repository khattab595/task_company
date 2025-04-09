
import '../../../src/main_index.dart';

class AppCircularIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback? onPressed;
  final double? size;
  final Color? color;
  final double? radius;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  const AppCircularIconButton({Key? key, required this.icon, this.onPressed, this.size, this.color, this.radius, this.backgroundColor, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? 0.paddingAll,
      child: CircleAvatar(
        radius: radius ?? 20,
        backgroundColor: backgroundColor,
        child: AppIconButton(
          icon: icon,
          color: color,
          size: size ?? 22,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
