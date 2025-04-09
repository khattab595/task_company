
// ignore_for_file: must_be_immutable

import '../widgets/dialogs/progress_dialog.dart';
import '/src/main_index.dart';
abstract class BaseStatelessWidget extends StatelessWidget {

  BuildContext? context = injector<ServicesLocator>().navigatorKey.currentContext;
  final strings = injector<ServicesLocator>().navigatorKey.currentContext!.strings ;
  ThemeData get theme => Theme.of(context!);
  TextTheme get textTheme => theme.textTheme;
  final local = injector<ServicesLocator>().navigatorKey.currentContext?.languageCode.toString();

  TextStyle get labelSmall => textTheme.labelSmall!;
  TextStyle get labelMedium => textTheme.labelMedium!;
  TextStyle get labelLarge => textTheme.labelLarge!;
  TextStyle get displaySmall => textTheme.displaySmall!;
  TextStyle get displayMedium => textTheme.displayMedium!;
  TextStyle get displayLarge => textTheme.displayLarge!;
  TextStyle get headlineSmall => textTheme.headlineSmall!;
  TextStyle get headlineMedium => textTheme.headlineMedium!;
  TextStyle get headlineLarge => textTheme.headlineLarge!;
  TextStyle get bodySmall => textTheme.bodySmall!;
  TextStyle get bodyMedium => textTheme.bodyMedium!;
  TextStyle get bodyLarge => textTheme.bodyLarge!;
  TextStyle get titleSmall => textTheme.titleSmall!;
  TextStyle get titleMedium => textTheme.titleMedium!;
  TextStyle get titleLarge => textTheme.titleLarge!;
  Color get errorColor => theme.colorScheme.error;
  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;
  Color get dividerColor => theme.dividerColor;
  Color get primaryColor => theme.primaryColor;
  Color get kOrange => theme.iconTheme.color!;
  Color get hintColor => theme.hintColor;
  Color get primaryContainer => theme.colorScheme.primaryContainer;
  Color get secondaryContainer => theme.colorScheme.secondaryContainer;
  Color get primaryColorDark => theme.primaryColorDark;
  Color get cardColor => theme.cardColor;
  Color get onPrimary => theme.colorScheme.onPrimary;
  EdgeInsetsGeometry get basePadding => const EdgeInsets.all(16);
  //static String routeName (){return '';}

  final CustomProgressDialog progress =
      DialogsManager.createProgress();

  bool isRtl() => local == 'ar';

  BaseStatelessWidget({Key? key}):  super(key: key);


  T? getArguments<T>(BuildContext context ){
    return context.getArguments();
  }

   handleErrorDialogBuilder(dynamic exception) {
    final context = this.context ;

    DialogsManager. showErrorDialog(context!, exception);

   }

}
