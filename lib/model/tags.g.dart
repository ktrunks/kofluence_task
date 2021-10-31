// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TagsAdapter extends TypeAdapter<Tags> {
  @override
  final int typeId = 2;

  @override
  Tags read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tags(
      tag: fields[0] as String,
      post: fields[1] as String,
      similarPost: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Tags obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.tag)
      ..writeByte(1)
      ..write(obj.post)
      ..writeByte(2)
      ..write(obj.similarPost);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TagsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
