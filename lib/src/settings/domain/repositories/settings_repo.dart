

import '../../data/models/contact_params.dart';

abstract class SettingsRepo {
  Future<String> fetchAboutLogeste();
  Future<String> contactUs(ContactParams params);
}
