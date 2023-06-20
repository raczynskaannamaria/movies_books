import 'dart:ffi';

import 'package:movies_books/domain/entities/cast_entity.dart';

class CastModel extends CastEntity {
  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      adult: json['adult'],
      gender: json['gender'] ?? 0.0,
      id: json['id'] ?? 0.0,
      knownForDepartment: json['known_for_department'] ?? '',
      name: json['name'] ?? '',
      originalName: json['original_name'] ?? '',
      popularity: json['popularity'],
      profilePath: json['profile_path'] ?? '',
      castId: json['cast_id'] ?? 0.0,
      character: json['character'] ?? '',
      creditId: json['credit_id'] ?? 0.0,
      order: json['order'] ?? 0.0,
    );
  }
  const CastModel({
    required bool adult,
    required int gender,
    required int id,
    required String knownForDepartment,
    required String name,
    required String originalName,
    required double popularity,
    required String profilePath,
    required int castId,
    required String character,
    required int creditId,
    required int order,
  }) : super(
          creditId: creditId,
          name: name,
          profilePath: profilePath,
          character: character,
        );

  static List<CastModel> from(List<dynamic> json) {
    return json.map((e) => CastModel.fromJson(e)).toList();
  }
}

/*class CastModel extends CastEntity {
  final int castId;
  final String character;
  final int creditId;
  final String gender;
  final int id;
  final String name;
  final int order;
  final String profilePath;

  CastModel({
    required this.castId,
    required this.character,
    required this.creditId,
    required this.gender,
    required this.id,
    required this.name,
    required this.order,
    required this.profilePath,
  }) : super(
          creditId: creditId,
          name: name,
          profilePath: profilePath,
          character: character,
        );

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      castId: json['cast_id'] ?? 0,
      character: json['character'] ?? '',
      creditId: json['credit_id'] ?? 0,
      gender: json['gender'] ?? '',
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      order: json['order'] ?? 0,
      profilePath: json['profile_path'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cast_id'] = this.castId;
    data['character'] = this.character;
    data['credit_id'] = this.creditId;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['name'] = this.name;
    data['order'] = this.order;
    data['profile_path'] = this.profilePath;
    return data;
  }

  static List<CastModel> from(List<dynamic> json) {
    return json.map((e) => CastModel.fromJson(e)).toList();
  }
}*/
