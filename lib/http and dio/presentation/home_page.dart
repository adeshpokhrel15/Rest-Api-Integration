import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home Page'),
        ),
        body:
            //
            Consumer(builder: (context, ref, child) {
          final data = ref.watch(userProvider);

          return data.when(
              data: (data) => ListView(
                    children: [
                      ...data.map((e) => ListTile(
                            title: Text(e.lastName),
                          ))
                    ],
                  ),
              error: (err, s) => Text(err.toString()),
              loading: () => const Center(child: CircularProgressIndicator()));
        }));
  }
}
