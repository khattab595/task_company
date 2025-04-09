import 'package:json_annotation/json_annotation.dart'; 

part 'contact_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ContactParams {
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'message')
  String? message;

  ContactParams({this.phone, this.email, this.message});

   factory ContactParams.fromJson(Map<String, dynamic> json) => _$ContactParamsFromJson(json);

   Map<String, dynamic> toJson() => _$ContactParamsToJson(this);
}

