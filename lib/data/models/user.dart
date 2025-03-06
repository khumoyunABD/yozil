import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String name,
    required DateTime createdAt,
    @Default('customer') String userType,
    @Default(false) bool isPremium,
    String? phoneNumber,
    String? businessName,
    String? businessDescription,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

//previous user model
//@freezed
// class User with _$User {
//   factory User({
//     String? id,
//     required String email,
//     String? phoneNumber,
//     String? name,
//     String? gender,
//     String? profileImage,
//     DateTime? birthDate,
//     DateTime? createdAt,
//     Address? address,
//     @Default([]) List<String> favoriteShops,
//     @Default(false) bool isEmailVerified,
//     @Default(false) bool isPhoneVerified,
//     DateTime? lastLoginAt,
//     String? deviceToken, // For push notifications
//   }) = _User;

//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
// }
