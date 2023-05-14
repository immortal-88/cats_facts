import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_info.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class CatInfo extends Equatable {
  const CatInfo(
      {this.imageUrl, required this.description, required this.createdAt});

  final String? imageUrl;
  @HiveField(0)
  final String description;
  @HiveField(1)
  final DateTime createdAt;

  @override
  List<Object> get props => [description, createdAt];

  static final empty =
      CatInfo(description: 'No cat info', createdAt: DateTime.now());
}
