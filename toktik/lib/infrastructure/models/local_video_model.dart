import 'dart:convert';

import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel {
  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  VideoPost toVideoPostEntity() {
    return VideoPost(
      caption: name,
      videoUrl: videoUrl,
      likes: likes,
      views: views,
    );
  }

  LocalVideoModel copyWith({
    String? name,
    String? videoUrl,
    int? likes,
    int? views,
  }) {
    return LocalVideoModel(
      name: name ?? this.name,
      videoUrl: videoUrl ?? this.videoUrl,
      likes: likes ?? this.likes,
      views: views ?? this.views,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'videoUrl': videoUrl,
      'likes': likes,
      'views': views,
    };
  }

  factory LocalVideoModel.fromMap(Map<String, dynamic> map) {
    return LocalVideoModel(
      name: map['name'],
      videoUrl: map['videoUrl'],
      likes: map['likes'],
      views: map['views'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalVideoModel.fromJson(String source) => LocalVideoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LocalVideoModel(name: $name, videoUrl: $videoUrl, likes: $likes, views: $views)';
  }

  @override
  bool operator ==(covariant LocalVideoModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.videoUrl == videoUrl && other.likes == likes && other.views == views;
  }

  @override
  int get hashCode {
    return name.hashCode ^ videoUrl.hashCode ^ likes.hashCode ^ views.hashCode;
  }
}
