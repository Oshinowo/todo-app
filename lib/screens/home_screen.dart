import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/counter/counter_bloc.dart';
import 'package:todo_app/screens/other_screen.dart';

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
      body: BlocListener<CounterBloc, CounterState>(
        listener: (context, state) {
          if (state.counter == 3) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(
                    'counter is ${state.counter}',
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                );
              },
            );
          } else if (state.counter == -1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OtherScreen(),
              ),
            );
          }
        },
        child: Center(
          child: Text('${context.watch<CounterBloc>().state.counter}'),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              BlocProvider.of<CounterBloc>(context)
                  .add(DecreamentCounterEvent());
            },
            child: const Icon(
              Icons.remove,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () async {
              context.read<CounterBloc>().add(IncreamentCounterEvent());
            },
            child: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
    );
  }
}
