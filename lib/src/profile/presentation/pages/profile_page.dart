
import '../../../../core/components/base_widget_bloc.dart';
import '../../../main_index.dart';
import '../../domain/entities/profile.dart';
import '../bloc/profile_bloc.dart';
import 'profile_screen.dart';

class ProfilePage extends BaseBlocWidget<UnInitState, ProfileBloc>{
  ProfilePage({Key? key}) : super(key: key);

  // @override
  // void loadInitialData(BuildContext context) {
  //   bloc.fetchProfileData();
  // }

  @override
  String? title(BuildContext context) => '';

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return ProfileScreen(
      onLogout: () => bloc.logout(),
    );
  }

}

