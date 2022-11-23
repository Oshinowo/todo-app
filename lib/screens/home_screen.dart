import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/color/color_bloc.dart';
import 'package:todo_app/blocs/counter/counter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ColorBloc>().state.color,
      appBar: AppBar(
        title: const Text('Code is Magic'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<ColorBloc>().add(ChangeColorEvent());
              },
              child: const Text(
                'Change Colour',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              '${context.watch<CounterBloc>().state.counter}',
              style: const TextStyle(fontSize: 38, color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(ChangeCounterEvent());
              },
              child: const Text(
                'Increament Counter',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
