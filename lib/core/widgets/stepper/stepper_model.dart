import 'dart:ui';

class StepperModel{
  final String title;
  final String subTitle;
  final bool isActive;
  final Color? color;
  final Color? colorText;

  StepperModel({
    required this.title,
    required this.subTitle,
    required this.isActive,
    this.colorText,
    this.color,
  });
}