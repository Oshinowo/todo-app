import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/theme/theme_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Code is Magic'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            int radInt = Random().nextInt(10);
            print(radInt);
            context.read<ThemeBloc>().add(ChangeThemeEvent(radInt));
          },
          child: const Text('Change App Theme'),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {},
            child: const Icon(
              Icons.remove,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () async {},
            child: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
    );
  }
}
