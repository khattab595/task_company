import 'package:app/core/exceptions/extensions.dart';

import '../di/injector.dart';
import 'app_base_exception.dart';

abstract class AppException implements AppBaseException {

  @override
  String toLocalize(String local) {
    return  local == "ar" ?messageAr : messageAr ;
  }


  @override
  String toString() {
    final  lang = injector<ServicesLocator>().navigatorKey.currentContext!.languageCode.toString() ;
    return  lang == "ar" ?messageAr : messageEn ;
  }

  @override
  String toLocalizeMessage() {
    final  lang =injector<ServicesLocator>().navigatorKey.currentContext!.languageCode.toString() ;
    return toLocalize(lang);
  }



}
