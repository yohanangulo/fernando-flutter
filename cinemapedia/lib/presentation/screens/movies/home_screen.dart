import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideshowMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: initialLoading
          ? CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  flexibleSpace: FlexibleSpaceBar(title: CustomAppBar()),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      MoviesSlideshow(movies: slideshowMovies),
                      MovieHorizontalListView(
                        loadNextPage: ref
                            .read(nowPlayingMoviesProvider.notifier)
                            .loadNextPage,
                        movies: nowPlayingMovies,
                        title: 'En cines',
                        subtitle: 'Lunes 20',
                      ),
                      MovieHorizontalListView(
                        loadNextPage: ref
                            .read(popularMoviesProvider.notifier)
                            .loadNextPage,
                        movies: popularMovies,
                        title: 'Populares',
                      ),
                      MovieHorizontalListView(
                        loadNextPage: ref
                            .read(upcomingMoviesProvider.notifier)
                            .loadNextPage,
                        movies: upcomingMovies,
                        title: 'Proximamente',
                      ),
                      MovieHorizontalListView(
                        loadNextPage: ref
                            .read(topRatedMoviesProvider.notifier)
                            .loadNextPage,
                        movies: topRatedMovies,
                        title: 'Top Rated',
                      ),
                    ],
                  ),
                ),
              ],
            )
          : FullScreenLoader(),
    );
  }
}
