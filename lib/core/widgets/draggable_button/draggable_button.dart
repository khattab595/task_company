import 'package:app/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import 'draggable_floating_action_button_config.dart';

class DraggableButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final Offset? initialOffset;
  const DraggableButton({Key? key, this.icon, this.onPressed, this.color, this.height, this.width, this.initialOffset, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey parentKey = GlobalKey();

    return SizedBox(
      height: height ?? context.height * 0.6,
      child: Stack(
        key: parentKey,
        children: [
          DraggableFloatingActionButtonConfig(
            initialOffset: initialOffset ?? const Offset(0, 24),
            parentKey: parentKey,
              onPointerUp: () {},
            child: FloatingActionButton(
              onPressed: onPressed,
              backgroundColor: backgroundColor,
              child: Icon(icon ?? Icons.add, color: color ),
            ),
          ),
        ],
      ),
    );
  }
}
