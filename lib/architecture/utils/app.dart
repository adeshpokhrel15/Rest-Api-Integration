import 'package:flutter/material.dart';
import 'package:restapi_flutter/architecture/features/home/home_page.dart';

class RiverpodApp extends StatelessWidget {
  const RiverpodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
