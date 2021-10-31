// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostAdapter extends TypeAdapter<Post> {
  @override
  final int typeId = 1;

  @override
  Post read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Post(
      entityType: fields[0] as String,
      attachment: fields[1] as String,
      timeCreated: fields[2] as String,
      timeUpdated: fields[3] as String,
      commentsCount: fields[4] as int,
      likeCount: fields[5] as int,
      thumbnailSrc: fields[6] as String,
      tags: (fields[7] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.entityType)
      ..writeByte(1)
      ..write(obj.attachment)
      ..writeByte(2)
      ..write(obj.timeCreated)
      ..writeByte(3)
      ..write(obj.timeUpdated)
      ..writeByte(4)
      ..write(obj.commentsCount)
      ..writeByte(5)
      ..write(obj.likeCount)
      ..writeByte(6)
      ..write(obj.thumbnailSrc)
      ..writeByte(7)
      ..write(obj.tags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
