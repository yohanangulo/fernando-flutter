import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discorverProvider = context.watch<DiscoverProvider>();

    Widget content = VideoScrollableView(videos: discorverProvider.videos);

    if (discorverProvider.initialLoading) {
      content = const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }

    return Scaffold(body: content);
  }
}
