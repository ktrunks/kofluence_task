import 'package:hive/hive.dart';

part 'post.g.dart';

@HiveType(typeId: 1)
class Post {
  @HiveField(0)
  String entityType;
  @HiveField(1)
  String attachment;
  @HiveField(2)
  String timeCreated;
  @HiveField(3)
  String timeUpdated;
  @HiveField(4)
  int commentsCount;
  @HiveField(5)
  int likeCount;
  @HiveField(6)
  String thumbnailSrc;
  @HiveField(7)
  List<String> tags;

  Post(
      {required this.entityType,
      required this.attachment,
      required this.timeCreated,
      required this.timeUpdated,
      required this.commentsCount,
      required this.likeCount,
      required this.thumbnailSrc,
      required this.tags});
}
