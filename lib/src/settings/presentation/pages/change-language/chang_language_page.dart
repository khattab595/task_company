import 'package:flutter/material.dart';
import 'package:app/core/widgets/scaffold/app_scaffold.dart';

import '../../../../../core/components/base_stateless_widget.dart';
import 'chang_language_screen.dart';

class ChangLanguagePage extends BaseStatelessWidget {
  ChangLanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AppScaffold(
      title: strings.change_language,
        body: ChangLanguageScreen());
  }
}


