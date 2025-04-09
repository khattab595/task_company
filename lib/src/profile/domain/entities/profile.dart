import '../../data/models/profile_dto.dart';

class Profile {
  int? id;
  String? num;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? image;
  String? token;

  Profile(
      {this.id,
      this.num,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.image,
      this.token});

  factory Profile.fromJson(ProfileDto json) => Profile(
        token: json.token,
      );
}
