import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

class ThemeNotifier extends Notifier<AppTheme> {
  @override
  AppTheme build() {
    return AppTheme(
      isDarkMode: false,
      selectedColor: 0,
    );
  }

  void toggleTheme() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void selectColor(int index) {
    state = state.copyWith(selectedColor: index);
  }
}

class ThemeProvider extends Notifier<bool> {
  @override
  build() => false;

  void toggle() => state = !state;
}

class SelectedColorProvider extends Notifier<int> {
  @override
  build() => 0;

  void selectColor(int index) => state = index;
}

final isDakModeProvider =
    NotifierProvider<ThemeProvider, bool>(ThemeProvider.new);

final selectedColorProvider =
    NotifierProvider<SelectedColorProvider, int>(SelectedColorProvider.new);

final colorListProvider = Provider((ref) => colorList);

final appThemeProvider =
    NotifierProvider<ThemeNotifier, AppTheme>(ThemeNotifier.new);
