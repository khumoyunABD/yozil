import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  factory Category({
    required String id,
    required String name,
    String? slug,
    String? description,
    String? iconUrl,
    String? imageUrl,
    @Default(0) int displayOrder,
    @Default(true) bool isActive,
    @Default(false) bool isFeatured,
    @Default(0) int serviceCount,
    @Default(0) int providerCount,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
