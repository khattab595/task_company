import 'package:app/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:app/core/network/api_response.dart';

import '../models/contact_params.dart';

part 'settings_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  SettingsDatasource{

  @factoryMethod
  factory SettingsDatasource(Dio dio) = _SettingsDatasource;

  @GET('/api/v1/Operations/GetAllOperations')
  Future<ApiResponse<String>> fetchAboutLogeste();

  @POST('/v1/storecontact')
  Future<ApiResponse> contactUs(@Body() ContactParams params);
}