import 'package:flutter/material.dart';
import 'package:ndenicolais/routes.dart';
import 'package:provider/provider.dart';
import 'package:ndenicolais/providers/theme_notifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nicola De Nicolais",
      theme: Provider.of<ThemeNotifier>(context).currentTheme,
      initialRoute: Routes.intro,
      routes: Routes.getRoutes(),
    );
  }
}
