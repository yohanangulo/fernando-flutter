import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});

  static const String name = 'theme_changer_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(appThemeProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            onPressed: ref.read(appThemeProvider.notifier).toggleTheme,
            icon: Icon(
              isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
          ),
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorListProvider);
    final theme = ref.watch(appThemeProvider);

    return RadioGroup(
      groupValue: theme.selectedColor,
      onChanged: (value) {
        ref.read(appThemeProvider.notifier).selectColor(value!);
      },
      child: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final color = colors[index];
          return RadioListTile(
            title: Text('Este color', style: TextStyle(color: color)),
            subtitle: Text(color.toARGB32().toString()),
            activeColor: color,
            value: index,
          );
        },
      ),
    );
  }
}
