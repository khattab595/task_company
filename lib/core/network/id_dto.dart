import 'package:json_annotation/json_annotation.dart'; 

part 'id_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class IdDto {
  @JsonKey(name: 'id')
  int? id;

  IdDto({this.id});

   factory IdDto.fromJson(Map<String, dynamic> json) => _$IdDtoFromJson(json);

   Map<String, dynamic> toJson() => _$IdDtoToJson(this);
}

