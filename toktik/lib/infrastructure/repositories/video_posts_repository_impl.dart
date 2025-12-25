import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  VideoPostsRepositoryImpl(this._videoPostsDatasource);

  final VideoPostsDatasource _videoPostsDatasource;

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    return _videoPostsDatasource.getFavoriteVideosByUser(userId);
  }

  @override
  Future<List<VideoPost>> getTrendingViewsByPage(int page) {
    return _videoPostsDatasource.getTrendingViewsByPage(page);
  }
}
