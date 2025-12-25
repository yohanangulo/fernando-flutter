import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/infrastructure/datasources/local_video_datasource_imp.dart';
import 'package:toktik/infrastructure/repositories/video_posts_repository_impl.dart';

import 'package:toktik/presentation/providers/discover_provider.dart';

class GlobalProviders extends StatelessWidget {
  const GlobalProviders({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final videoPostRepository = VideoPostsRepositoryImpl(LocalVideoDatasource());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DiscoverProvider(videoPostRepository)..loadNextPage()),
      ],
      child: child,
    );
  }
}
