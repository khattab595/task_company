
import 'package:injectable/injectable.dart';
import '../../domain/repositories/profile_repo.dart';
import '../data_sources/profile_datasource.dart';


@Injectable(as: ProfileRepo)
class ProfileRepoImp extends ProfileRepo{
  final ProfileDataSource  apiProvider;
  ProfileRepoImp(this.apiProvider);




}