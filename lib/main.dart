import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_it/core/view/home_view.dart';
import 'package:shop_it/product/theme/project_theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop It',
      debugShowCheckedModeBanner: false,
      theme: ProjectTheme.theme,
      home: const HomeView(),
    );
  }
}
