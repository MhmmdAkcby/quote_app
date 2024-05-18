import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_app/dummy_quote/product/global/theme_notifer.dart';
import 'package:quote_app/dummy_quote/view/home_view.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeNotifer>(
    create: (context) => ThemeNotifer(),
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: context.watch<ThemeNotifer>().currentTheme,
      home: const HomeView(),
    );
  }
}
