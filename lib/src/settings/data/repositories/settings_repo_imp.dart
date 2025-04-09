
import 'package:injectable/injectable.dart';
import 'package:app/src/settings/data/data_sources/settings_datasource.dart';

import '../../domain/repositories/settings_repo.dart';
import '../models/contact_params.dart';

@Injectable(as: SettingsRepo)
class SettingsRepoImp extends SettingsRepo{
  final SettingsDatasource  apiProvider;
  SettingsRepoImp(this.apiProvider);


  @override
  Future<String> fetchAboutLogeste() async{
    final data = await apiProvider.fetchAboutLogeste();
    return data.data!;
  }

  @override
  Future<String> contactUs(ContactParams params) async{
    final data = await apiProvider.contactUs(params);
    return data.message ?? '';
  }

}