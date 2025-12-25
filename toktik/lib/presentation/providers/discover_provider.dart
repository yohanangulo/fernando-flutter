import 'package:flutter/material.dart';

import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  DiscoverProvider(this._videoPostRepository);

  final VideoPostRepository _videoPostRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  void loadNextPage() async {
    final newVideos = await _videoPostRepository.getTrendingViewsByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
