import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodels/cruise_viewmodels.dart';
import 'views/cruise_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CruiseViewModel(),
      child: const RajangCruiseApp(),
    ),
  );
}

class RajangCruiseApp extends StatelessWidget {
  const RajangCruiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CruiseViewModel>(
      builder: (context, viewModel, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          title: 'Rajang River Cruise',

          // Light Theme
          theme: ThemeData.light().copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.light,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          ),

          // Dark Theme
          darkTheme: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.dark,
            ),
          ),

          // Dynamic Theme Switching
          themeMode: viewModel.isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,

          // Main Screen
          home: const CruiseScreen(),
        );
      },
    );
  }
}
