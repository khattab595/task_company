import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../domain/repositories/settings_repo.dart';

@Injectable()
class AboutLogesteCubit extends BaseCubit {
  final SettingsRepo usecase;

  AboutLogesteCubit(this.usecase);

  fetchAboutLogeste() async {

  }
}
