import 'package:equatable/equatable.dart';

class CastEntity extends Equatable {
  final int creditId;
  final String name;
  final String profilePath;
  final String character;

  const CastEntity({
    required this.creditId,
    required this.name,
    required this.profilePath,
    required this.character,
  });

  @override
  List<Object?> get props => [creditId];
}
