// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatInfoAdapter extends TypeAdapter<CatInfo> {
  @override
  final int typeId = 0;

  @override
  CatInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatInfo(
      description: fields[0] as String,
      createdAt: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CatInfo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatInfo _$CatInfoFromJson(Map<String, dynamic> json) => CatInfo(
      imageUrl: json['imageUrl'] as String?,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CatInfoToJson(CatInfo instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
    };
