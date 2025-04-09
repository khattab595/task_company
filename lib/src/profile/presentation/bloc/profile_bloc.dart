import 'package:app/src/main_index.dart';
import 'package:app/src/profile/domain/repositories/profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/helper_methods.dart';
import '../../../../core/utils/navigator.dart';

@Injectable()
class ProfileBloc extends BaseCubit {
  final ProfileRepo repo;

  ProfileBloc(this.repo);

  void logout() {
    executeSuccessState(() => HelperMethods.clearCashData(),
        onSuccess: (data) async {
      Navigators.pushReplacementNamed(Routes.loginPage);
    });
  }
}
