import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../../core/config/api/end_points.dart';
import '../../../../core/helper/classes/params.dart';
import '../../data/models/profile_model/profile_model.dart';
part 'profile_api_client.g.dart';

@injectable
@RestApi()
abstract class ProfileApiClient {
  @factoryMethod
  factory ProfileApiClient(Dio dio) = _ProfileApiClient;

  @GET(EndPoints.getProfileData)
  Future<ProfileModel> getProfileData();

  @PUT(EndPoints.updateProfile)
  Future<ProfileModel> updateProfileData(@Body() EditProfileParams params);
}
