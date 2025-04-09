import 'package:app/core/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';

import '../../components/base_stateless_widget.dart';

class ButtonChildScroll extends BaseStatelessWidget {
  final String title;
  final List<Widget> children;
  final Function()? onPressed;
   ButtonChildScroll({Key? key, required this.title, required this.children, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: children,
            ),
          )
        ),
        PrimaryButton(
          title: title,
          onPressed: onPressed,
          margin: basePadding,
        ),
      ],
    );
  }
}
