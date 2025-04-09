import '../../../profile/domain/entities/profile.dart';
import '../../data/models/login_params.dart';

abstract class AuthRepo {
  Future<Profile> login(LoginParams params);
}
