import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: theme.colorScheme.primary),
              const SizedBox(width: 5),
              Text('Cinemapedia', style: theme.textTheme.titleMedium),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.search_outlined),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
