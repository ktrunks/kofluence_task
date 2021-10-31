import 'dart:convert';

class AssetData {
  late final List<YourPost> yourPost;
  late final List<YourPost> similarPost;
  late final List<String> tags;

  AssetData(
      {required this.yourPost, required this.similarPost, required this.tags});

  AssetData.fromJson(Map<String, dynamic> json) {
    if (json['your_post'] != null) {
      yourPost = [];
      json['your_post'].forEach((v) {
        yourPost.add(YourPost.fromJson(v));
      });
    }
    if (json['similar_post'] != null) {
      similarPost = [];
      json['similar_post'].forEach((v) {
        similarPost.add(YourPost.fromJson(v));
      });
    }
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['your_post'] = this.yourPost.map((v) => v.toJson()).toList();
    data['similar_post'] = this.similarPost.map((v) => v.toJson()).toList();
    data['tags'] = this.tags;
    return data;
  }
}

class YourPost {
  late final int postId;
  late final String entityType;
  late final String attachment;
  late final String timeCreated;
  late final String timeUpdated;
  late final int commentsCount;
  late final int likeCount;
  late final List<String> tags;
  late final String thumbnailSrc;

  YourPost(
      {required this.postId,
      required this.entityType,
      required this.attachment,
      required this.timeCreated,
      required this.timeUpdated,
      required this.commentsCount,
      required this.likeCount,
      required this.tags,
      required this.thumbnailSrc});

  YourPost.fromJson(Map<dynamic, dynamic> json) {
    postId = json['post_id'];
    entityType = json['entity_type'];
    attachment = json['attachment'] ?? '';
    timeCreated = json['time_created'] ?? '';
    timeUpdated = json['time_updated'] ?? '';
    commentsCount = json['comments_count'] ?? 0;
    likeCount = json['like_count'] ?? 0;
    tags = json['tags'].cast<String>();
    thumbnailSrc = json['thumbnail_src'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_id'] = this.postId;
    data['entity_type'] = this.entityType;
    data['attachment'] = this.attachment;
    data['time_created'] = this.timeCreated;
    data['time_updated'] = this.timeUpdated;
    data['comments_count'] = this.commentsCount;
    data['like_count'] = this.likeCount;
    data['tags'] = this.tags;
    data['thumbnail_src'] = this.thumbnailSrc;
    return data;
  }
}
