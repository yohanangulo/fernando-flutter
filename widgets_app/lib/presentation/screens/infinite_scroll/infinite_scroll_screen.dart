import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({super.key});

  static const String name = 'infinite_scroll_screen';

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final ScrollController scrollController = ScrollController();
  final List<int> imagesIds = [1, 2, 3, 4, 5];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  void loadNextPage() async {
    if (isLoading) return;

    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();

    isLoading = false;
    if (!mounted) return;
    setState(() {});

    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) {
      return;
    }

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: context.pop,
        child: isLoading
            ? const CircularProgressIndicator(strokeWidth: 2)
            : const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      body: RefreshIndicator(
        edgeOffset: 40,
        strokeWidth: 2,
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
          if (!mounted) return;

          final lastId = imagesIds.last;
          imagesIds.clear();
          imagesIds.add(lastId + 1);
          addFiveImages();

          if (!mounted) return;
          setState(() {});
        },
        child: ListView.builder(
          controller: scrollController,
          padding: EdgeInsets.zero,
          itemCount: imagesIds.length,
          itemBuilder: (context, index) {
            final imageId = imagesIds[index];
            return FadeInImage(
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/jar-loading.gif'),
              width: double.infinity,
              height: 300,
              image: NetworkImage(
                'https://picsum.photos/id/$imageId/500/300',
              ),
            );
          },
        ),
      ),
    );
  }
}
