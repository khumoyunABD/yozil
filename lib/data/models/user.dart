import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yozil/data/data.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    String? id,
    required String email,
    String? phoneNumber,
    String? name,
    String? gender,
    String? profileImage,
    DateTime? birthDate,
    DateTime? createdAt,
    Address? address,
    @Default([]) List<String> favoriteShops,
    @Default(false) bool isEmailVerified,
    @Default(false) bool isPhoneVerified,
    DateTime? lastLoginAt,
    String? deviceToken, // For push notifications
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
