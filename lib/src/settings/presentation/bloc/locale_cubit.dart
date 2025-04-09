
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/helper_methods.dart';
import 'locale_state.dart';


class LocaleCubit extends Cubit<LocalState> {
  LocaleCubit() : super(LocalState()) {
    getLanguageData();
  }

  String lang = 'en';

  Future setLanguageData(String value) async {
    lang = value;
    await HelperMethods.setLanguage(value);
    emit(LocalState(language: lang, isLoading: false));
  }

  Future getLanguageData() async {
    emit(LocalState(isLoading: true));
    String language = await HelperMethods.getLanguage();
    lang = language;

    bool isFirstTime = await HelperMethods.isFirstTime();
    emit(LocalState(language: language,  isFirstTime: isFirstTime, isLoading: false));
  }
}
