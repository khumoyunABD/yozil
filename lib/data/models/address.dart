import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  factory Address({
    required String street,
    required String city,
    required String country,
    required double latitude,
    required double longitude,
    String? region,
    String? apartment,
    String? additionalInfo,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
