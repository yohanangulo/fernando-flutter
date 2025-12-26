import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProvider extends Notifier<bool> {
  @override
  build() => false;

  void toggle() => state = !state;
}

final themeProvider = NotifierProvider<ThemeProvider, bool>(ThemeProvider.new);
