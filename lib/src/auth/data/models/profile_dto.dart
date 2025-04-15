import 'package:json_annotation/json_annotation.dart';



part 'profile_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ProfileDto {

  @JsonKey(name: 'token')
  String? token;

  ProfileDto({  this.token});

   factory ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);

   Map<String, dynamic> toJson() => _$ProfileDtoToJson(this);
}

