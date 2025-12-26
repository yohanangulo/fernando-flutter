import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  static const String name = 'counter_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final isDarkMode = ref.watch(appThemeProvider).isDarkMode;
    final icon =
        isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined;

    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ref.read(counterProvider.notifier).increment,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Counter Riverpod'),
        actions: [
          IconButton(
            onPressed: ref.read(appThemeProvider.notifier).toggleTheme,
            icon: Icon(icon),
          )
        ],
      ),
      body: Center(
        child: Text('Count $count', style: theme.textTheme.titleLarge),
      ),
    );
  }
}
