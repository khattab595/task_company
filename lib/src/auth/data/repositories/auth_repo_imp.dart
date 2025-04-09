import 'package:app/core/firebase/notification_service.dart';
import 'package:google_api_availability/google_api_availability.dart';
import 'package:injectable/injectable.dart';
import 'package:app/src/auth/data/models/login_params.dart';

import '../../../../core/utils/helper_methods.dart';
import '../../../profile/domain/entities/profile.dart';
import '../../domain/repositories/auth_repo.dart';
import '../data_sources/auth_datasource.dart';

@Injectable(as: AuthRepo)
class AuthRepoImp extends AuthRepo {
  final AuthDataSource apiProvider;
  AuthRepoImp(this.apiProvider);

  @override
  Future<Profile> login(LoginParams params) async {
    final response = await apiProvider.login(params);
    await HelperMethods.saveToken(response.token ?? "");
    return Profile.fromJson(response);
  }
}
