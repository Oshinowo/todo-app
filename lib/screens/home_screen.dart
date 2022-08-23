import 'package:flutter/material.dart';

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
      body: const Center(
        child: Text('data'),
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
