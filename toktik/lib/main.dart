import 'package:flutter/material.dart';

import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/presentation/core/global_providers.dart';
import 'package:toktik/presentation/discover/screens/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalProviders(
      child: MaterialApp(
        title: 'TokTik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
