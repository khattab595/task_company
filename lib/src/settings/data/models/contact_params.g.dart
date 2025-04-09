// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactParams _$ContactParamsFromJson(Map<String, dynamic> json) =>
    ContactParams(
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ContactParamsToJson(ContactParams instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'message': instance.message,
    };
