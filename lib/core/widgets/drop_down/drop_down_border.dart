import '../../../src/main_index.dart';
import 'drop_down.dart';

class DropDownFieldBorder extends StatelessWidget {
  final List<DropDownItem> items;
  final String? title;
  final String? hint;
  final String? value;
  final TextStyle? texStyle;
  final IconData? prefixIcon;
  final Widget? iconWidget;
  final void Function(DropDownItem) onChanged;
  final bool isValidator;
  final String? Function(dynamic)? validator;
  final TextStyle? style;
  final Color? colorBorderSide;
  final Color? fillColor;
  final bool isLoading;

  const DropDownFieldBorder(
      {Key? key,
      required this.items,
      this.title,
      this.hint,
      required this.onChanged,
      this.prefixIcon,
      this.texStyle,
      this.value,
      this.iconWidget,
      this.isValidator = true,
      this.validator,
      this.style,
      this.colorBorderSide,
      this.fillColor,
      this.isLoading = false,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? borderColor = colorBorderSide ??
        context.theme.inputDecorationTheme.fillColor ??
        context.theme.colorScheme.onSurface;
    return Padding(
      padding: 16.paddingHoriz + 6.paddingVert,
      child: DropDownField(
        title: title,
        items: items,
        value: value,
        hint: hint,
        onChanged: onChanged,
        validator: isValidator ? validator : null,
        style: style,
        prefixIcon: prefixIcon,
        iconWidget: iconWidget,
        texStyle: texStyle ?? context.headlineSmall.copyWith(fontSize: 16),
        fillColor: fillColor ?? context.hintColor,
        colorBorderSide: context.backgroundColor,
          isLoading: isLoading,
        hintStyle: context.headlineSmall.copyWith(fontSize: 16),
      ),
    );
  }
}
