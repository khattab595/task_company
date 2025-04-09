import 'package:app/src/main_index.dart';

class CustomTextField extends BaseStatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? title;
  final bool isPassword;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final InputDecoration? inputDecoration;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final Widget? prefixIcon;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final Widget? suffixIcon;
  final int? maxLines;
  final Color? colorBorderSide;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;
  final double? radius;
  final bool? isValidator;
  final double? minHeight;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;

  CustomTextField(
      {Key? key,
      this.controller,
      this.hintText,
      this.title,
      this.isPassword = false,
      this.onTap,
      this.onChanged,
      this.validator,
      this.inputDecoration,
      this.keyboardType,
      this.fillColor,
      this.hintStyle,
      this.textAlign,
      this.prefixIcon,
      this.maxLines,
      this.colorBorderSide,
      this.margin,
      this.contentPadding,
      this.suffixIcon,
      this.radius,
      this.prefixIconPath,
      this.suffixIconPath,
      this.isValidator = true,
      this.minHeight,
      this.enabled = true,
      this.inputFormatters,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if
    Color? borderColor = colorBorderSide ?? primaryColorDark.withOpacity(0.1);
    return Padding(
      padding: margin ?? 15.paddingBottom,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            Text(
              title!,
              style: enabled
                  ? bodyMedium.copyWith(fontSize: 15)
                  : displayMedium.copyWith(fontSize: 15),
            ),
            7.ph,
          ],
          SizedBox(
            height: minHeight,
            child: TextFormField(
              onTap: onTap,
              readOnly: onTap != null,
              enabled: enabled,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textAlign: textAlign ?? TextAlign.start,
              maxLines: maxLines ?? 1,
              keyboardType:
                  isPassword ? TextInputType.visiblePassword : keyboardType,
              style: enabled
                  ? bodySmall.copyWith(fontSize: 16)
                  : displaySmall.copyWith(fontSize: 16),
              obscureText: isPassword,
              controller: controller,
              textInputAction: TextInputAction.next,
              cursorColor: context.primaryColor,
              inputFormatters: inputFormatters ?? [
                if (keyboardType == TextInputType.number)
                  FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: inputDecoration ??
                  InputDecoration(
                    hintText: hintText,
                    hintStyle: hintStyle ??
                        context.displaySmall.copyWith(fontSize: 16),
                    fillColor: fillColor ??
                        context.theme.inputDecorationTheme.fillColor,
                    filled: true,
                    prefixIconConstraints: BoxConstraints(
                      minWidth: minHeight ?? 35,
                      minHeight: minHeight ?? 35,
                    ),
                    prefixIcon: prefixIconPath != null
                        ? AppIcon(
                            padding: const EdgeInsets.all(12),
                            icon: prefixIconPath!,
                            size: 20,
                          )
                        : prefixIcon,
                    suffixIcon: suffixIconPath != null
                        ? AppIcon(
                            padding: const EdgeInsets.all(12),
                            icon: suffixIconPath!,
                            size: 0)
                        : suffixIcon,
                    contentPadding: contentPadding ??
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(radius ?? 6)),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(radius ?? 6)),
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(radius ?? 6)),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(radius ?? 6)),
                      borderSide: BorderSide(color: errorColor),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(radius ?? 6)),
                      borderSide: BorderSide(color: borderColor),
                    ),
                  ),
              validator: (isValidator! && validator == null)
                  ? (value) {
                      if (value == null || value.isEmpty) {
                        return context.getStrings().this_field_is_required;
                      }
                      return null;
                    }
                  : validator,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
