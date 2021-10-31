import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:kofluence_task/model/assets_data.dart';
import 'package:kofluence_task/model/post.dart';
import 'package:kofluence_task/model/tags.dart';
import 'package:path_provider/path_provider.dart';

class HomeController extends GetxController {
  var count = 0;

  var data = 'test';

  // SQLiteDbProvider sqLiteDbProvider = SQLiteDbProvider.fromInt();

  late List<dynamic> tags;

  late var path;

  late Box postsBox;

  late Box tagsBox;

  void increment() {
    count++;
    update();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    var path = await getApplicationDocumentsDirectory();
    this.path = path.path;
    Hive
      ..init(path.path)
      ..registerAdapter(PostAdapter())
      ..registerAdapter(TagsAdapter());

    Hive.openBox('posts').then((value) async {
      postsBox = value;
      Hive.openBox('tags').then((value) async {
        tagsBox = value;
        readDataFromAsset();
      });
    });
  }

  void readDataFromAsset() {
    DefaultAssetBundle.of(Get.context!)
        .loadString("assets/data.json")
        .then((value) {
      var data = jsonDecode(value);
      AssetData assetData = AssetData.fromJson(data);
      if (postsBox.length == 0) {
        insertPosts(assetData, 'post');
        insertSimilarPost(assetData, 'similar_post');
      }
    });
  }

  void insertPosts(AssetData assetData, String type) async {
    for (YourPost post in assetData.yourPost) {
      debugPrint('post data inset -- ${post.toJson()}');
      debugPrint(
          'check if data exists or not --- ${postsBox.values.contains(Post(entityType: post.entityType, attachment: post.attachment, timeCreated: post.timeCreated, timeUpdated: post.timeUpdated, commentsCount: post.commentsCount, likeCount: post.likeCount, thumbnailSrc: post.thumbnailSrc, tags: post.tags))}');
      postsBox
          .add(Post(
              entityType: post.entityType,
              attachment: post.attachment,
              timeCreated: post.timeCreated,
              timeUpdated: post.timeUpdated,
              commentsCount: post.commentsCount,
              likeCount: post.likeCount,
              thumbnailSrc: post.thumbnailSrc,
              tags: post.tags))
          .then((value) {
        insertTags('test');
      });
    }
  }

  void insertSimilarPost(AssetData assetData, String type) {
    for (YourPost post in assetData.similarPost) {
      debugPrint('post data inset -- ${post.toJson()}');
      postsBox.add(Post(
          entityType: post.entityType,
          attachment: post.attachment,
          timeCreated: post.timeCreated,
          timeUpdated: post.timeUpdated,
          commentsCount: post.commentsCount,
          likeCount: post.likeCount,
          thumbnailSrc: post.thumbnailSrc,
          tags: post.tags));
    }
  }

  void getAllPosts() {
    debugPrint('all post --- ${postsBox.values.toList().length}');
  }

  void insertTags(String tags) {
    tagsBox.add(tags);
    // if (allHashTags.containsKey(tags)) {
    //   if (type == 'post') {
    //     List<dynamic> postId = allHashTags['post'] ?? [];
    //     if (!postId.contains(post.postId)) postId.add(post.postId);
    //   } else {
    //     List<dynamic> postId = allHashTags['similar_post'] ?? [];
    //     if (!postId.contains(post.postId)) postId.add(post.postId);
    //   }
    // } else {
    //   Map<String, dynamic> data = {};
    //   if (type == 'post') {
    //     List<dynamic> postId = [];
    //     postId.add(post.postId);
    //     data['post'] = postId;
    //   } else {
    //     List<dynamic> postId = [];
    //     postId.add(post.postId);
    //     data['similar_post'] = postId;
    //   }
    // }
  }

  void getTags() {
    /*sqLiteDbProvider.getTags().then((List<Tags> value) {
      for (Tags tag in value) {
        debugPrint(' tags --- $tag');
        tags = tag.tag;
      }
    });*/
  }

  @override
  void onClose() {
    super.onClose();
  }
}
