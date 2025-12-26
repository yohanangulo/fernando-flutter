import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final slides = <SlideInfo>[
  SlideInfo(
    title: 'Busca la comida',
    caption: 'Lorem ipsum dolor'
        'sit amet, consectetur'
        'adipiscing elit.',
    imageUrl: 'assets/1.png',
  ),
  SlideInfo(
    title: 'Entrega la comida',
    caption: 'Lorem ipsum dolor'
        'sit amet, consectetur'
        'adipiscing elit.',
    imageUrl: 'assets/2.png',
  ),
  SlideInfo(
    title: 'Disfruta la comida',
    caption: 'Lorem ipsum dolor'
        'sit amet, consectetur'
        'adipiscing elit.',
    imageUrl: 'assets/3.png',
  ),
];

class SlideInfo {
  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  final String title;
  final String caption;
  final String imageUrl;
}

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  static const String name = 'app_tutorial_screen';

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController _pageController = PageController();
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final page = _pageController.page ?? 0;
      if (!isLastPage && page >= slides.length - 1.5) {
        setState(() {
          isLastPage = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            children: slides.map((s) => _Slide(s)).toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: context.pop,
              child: const Text('Salir'),
            ),
          ),
          if (isLastPage)
            Positioned(
              right: 20,
              bottom: 50,
              child: FilledButton(
                onPressed: context.pop,
                child: const Text('Comenzar'),
              ).fadeInRight(
                from: 15,
                duration: const Duration(milliseconds: 300),
              ),
            )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide(this.slideInfo);

  final SlideInfo slideInfo;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(slideInfo.imageUrl)),
            const SizedBox(height: 20),
            Text(slideInfo.title, style: titleStyle),
            const SizedBox(height: 10),
            Text(slideInfo.caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
