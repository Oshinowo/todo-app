import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/screens/other_screen.dart';

import '../cubits/counter/counter_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Code is Magic'),
      ),
      body: Center(
        child: BlocConsumer<CounterCubit, CounterState>(
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
                  builder: (context) => const OtherPage(),
                ),
              );
            }
          },
          builder: (context, state) {
            return Text(
              '${state.counter}',
              style: const TextStyle(
                fontSize: 30,
              ),
            );
          },
        ),
        //  USING BLOCLISTENER(for one-time actions like displaying a dialog or Navigation) TO WRAP BLOCBUILDER, (but blocconsumer is better).
        // BlocListener<CounterCubit, CounterState>(
        //   listener: (context, state) {
        //     if (state.counter == 3) {
        //       showDialog(
        //         context: context,
        //         builder: (context) {
        //           return AlertDialog(
        //             content: Text(
        //               'counter is ${state.counter}',
        //               style: const TextStyle(
        //                 fontSize: 30,
        //               ),
        //             ),
        //           );
        //         },
        //       );
        //     } else if (state.counter == -1) {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => const OtherPage(),
        //         ),
        //       );
        //     }
        //   },
        //   child: BlocBuilder<CounterCubit, CounterState>(
        //     builder: (context, state) {
        //       // return Text(
        //       //   '${state.counter}', // 2nd method of listening. (wrapping with blocBuilder)
        //       //   // '${BlocProvider.of<CounterCubit>(context, listen: true).state.counter}', // 1st method of listening
        //       //   // '${context.watch<CounterCubit>().state.counter}',
        //       //   style: const TextStyle(
        //       //     fontSize: 30,
        //       //   ),
        //       // );
        //       return Text(
        //         '${state.counter}',
        //         style: const TextStyle(
        //           fontSize: 30,
        //         ),
        //       );
        //     },
        //   ),
        // ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increment();
              // BlocProvider.of<CounterCubit>(context).increment();
            },
            child: const Icon(
              Icons.add,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrement();
            },
            child: const Icon(
              Icons.remove,
            ),
          )
        ],
      ),
    );
  }
}
