import 'package:hive/hive.dart';
part 'tags.g.dart';

@HiveType(typeId: 2)
class Tags {
  @HiveField(0)
  String tag;
  @HiveField(1)
  String post;
  @HiveField(2)
  String similarPost;

  Tags({required this.tag, required this.post, required this.similarPost});
}
