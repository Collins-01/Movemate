import 'package:flutter/material.dart';
import 'package:movemate/presentation/views/home_view.dart';
import 'package:movemate/utils/utils.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppAssets.preCacheAssets(context);
    return const MaterialApp(
      home: HomeView(),
    );
  }
}
