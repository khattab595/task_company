import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../src/main_index.dart';
import 'api_exception.dart';
import 'empty_list_exception.dart';

extension AppResource on BuildContext {

  AppLocalizations getStrings() {
    var stringRes = AppLocalizations.of(this);
    return stringRes! ;
  }

  T? getArguments<T>(){
    return ModalRoute.of(this)?.settings.arguments as T?;
  }

  String handleApiErrorMessage({required dynamic exception}) {
    final strings = injector<ServicesLocator>().appContext.strings;
    String message = strings.something_went_wrong;

    if (kDebugMode) {
      print('handleApiError is dio   ${exception is DioException}');
    }
    if (exception is DioException) {


      if (exception.error is WebSocketException ||
          exception.error is HandshakeException) {
        message = 'error_internet_connection';
      } else if (exception.error is SocketException ||
          exception.error is TimeoutException ||
          exception.error is TimeoutException || exception.type == DioExceptionType.connectionTimeout) {
        message = 'error_internet_connection';
      }
      else if (exception.error is ApiException) {
        message = (exception.error as ApiException).message;
        print('handleApiError whenApiException is dio   $message');

      }
    }

    if (exception is ApiException) {
      message = exception.message;
    }

    if (exception is SocketException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = 'error_internet_connection';
    }

    if (exception is WebSocketException || exception is HandshakeException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = 'check_network_connection';
    }

    if (exception is EmptyListException) {
      print('handleApiError is EmptyListException   ${exception.toString()}' );
      message = exception.toString();
    }
    // if (exception is DioException && exception.response?.data != null) {
    //   message = exception.response?.data['message']['message'];
    // }
    return message;
  }

  ApiException handleApiError({required dynamic exception}) {
    String message = getStrings().something_went_wrong;
    int code = 0;
    if (exception is DioException) {
      print('handleApiError is dio   ${exception.error is ApiException}');

      if (exception.error is WebSocketException ||
          exception.error is HandshakeException) {
        message = getStrings().error_internet_connection;
      } else if (exception.error is SocketException ||
          exception.error is TimeoutException ||
          exception.error is TimeoutException || exception.type == DioExceptionType.connectionTimeout) {
        message = getStrings().error_internet_connection;
      }
      else if (exception.error is ApiException) {
        message = (exception.error as ApiException).message;
        code = (exception.error as ApiException).code ;
      }
    }

    if (exception is ApiException) {
      message = exception.message;
      code = exception.code;
    }

    if (exception is SocketException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = getStrings().error_internet_connection;
    }

    if (exception is WebSocketException || exception is HandshakeException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = getStrings().check_network_connection;
    }

    if (exception is EmptyListException) {
      print('handleApiError is EmptyListException   ${exception.toString()}' );
      message = exception.toString();
    }
    print('handleApiError message $message');
    return ApiException(message ,code);
  }


}

extension NullOrEmpty on String? {
  bool isNullOrEmpty() {
    return this == null || this!.trim().isEmpty ;
  }
}



extension ThemesExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  Color get cardColor => Theme.of(this).cardColor;

  Color get backgroundColor => Theme.of(this).colorScheme.background;

  Color get secondary => Theme.of(this).colorScheme.secondary;

  Color get secondaryContainer => Theme.of(this).colorScheme.secondaryContainer;

  Color get primaryContainer => Theme.of(this).colorScheme.primaryContainer;

  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  Color get outline => Theme.of(this).colorScheme.outline;

  Color get errorColor => Theme.of(this).colorScheme.error;

  Color get errorContainer => Theme.of(this).colorScheme.errorContainer;

  Color get hintColor => Theme.of(this).hintColor;

  Color get dividerColor => Theme.of(this).dividerColor;

  TextStyle get titleLarge => textTheme.titleLarge!;

  TextStyle get titleMedium => textTheme.titleMedium!;

  TextStyle get titleSmall => textTheme.titleSmall!;

  TextStyle get labelLarge => textTheme.labelLarge!;

  TextStyle get labelMedium => textTheme.labelMedium!;

  TextStyle get labelSmall => textTheme.labelSmall!;

  TextStyle get bodyLarge => textTheme.bodyLarge!;

  TextStyle get bodyMedium => textTheme.bodyMedium!;

  TextStyle get bodySmall => textTheme.bodySmall!;

  TextStyle get displayLarge => textTheme.displayLarge!;

  TextStyle get displayMedium => textTheme.displayMedium!;

  TextStyle get displaySmall => textTheme.displaySmall!;

  TextStyle get headlineLarge => textTheme.headlineLarge!;

  TextStyle get headlineMedium => textTheme.headlineMedium!;

  TextStyle get headlineSmall => textTheme.headlineSmall!;
}


extension LocaleExtension on BuildContext {
  Locale get locale => Localizations.localeOf(this);

  String get languageCode => locale.languageCode;

  String get countryCode => locale.countryCode!;

  String get ar => 'ar';
  String get en => 'en';
}

extension AppLocalizationsShortcuts on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this)!;
}


extension PaddingExtension on num {

  EdgeInsetsDirectional get paddingAll => EdgeInsetsDirectional.all(toDouble());

  EdgeInsetsDirectional get paddingVert => EdgeInsetsDirectional.symmetric(vertical: toDouble());

  EdgeInsetsDirectional get paddingHoriz => EdgeInsetsDirectional.symmetric(horizontal: toDouble());

  EdgeInsetsDirectional get paddingStart => EdgeInsetsDirectional.only(start: toDouble());

  EdgeInsetsDirectional get paddingEnd => EdgeInsetsDirectional.only(end: toDouble());

  EdgeInsetsDirectional get paddingTop => EdgeInsetsDirectional.only(top: toDouble());

  EdgeInsetsDirectional get paddingBottom => EdgeInsetsDirectional.only(bottom: toDouble());
}

extension EmptyPaadding on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
  SizedBox get phShrink => const SizedBox.shrink();
}

extension SizeExtension on BuildContext {
  BuildContext get context => injector<ServicesLocator>().appContext;
  MediaQueryData get mediaQuery => MediaQuery.of(context);
  double get width => mediaQuery.size.width;

  double get height => mediaQuery.size.height;

}

extension FirstWhereOrNullExtension<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (var element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}
