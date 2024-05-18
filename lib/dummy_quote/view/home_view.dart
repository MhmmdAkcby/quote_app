import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_app/dummy_quote/product/color/project_color.dart';
import 'package:quote_app/dummy_quote/product/global/theme_notifer.dart';
import 'package:quote_app/dummy_quote/view/dummy_view/dummy_view.dart';

part 'part_of_appBar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _PartOfAppBar(),
      body: Column(
        children: [Expanded(child: DummyView())],
      ),
    );
  }
}
