
 import '../../data/models/login_params.dart';
import '../../data/models/profile_dto.dart';


abstract class AuthRepo {
  Future<ProfileDto> login(LoginParams params);

}
