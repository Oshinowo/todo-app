import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/blocs.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'TODO',
          style: TextStyle(fontSize: 40),
        ),
        // BlocBuilder<ActiveTodoCountCubit, ActiveTodoCountState>(
        //   builder: (context, state) {
        //     return Text(
        //       '${state.activeTodoCount} items',
        //       style: const TextStyle(
        //         fontSize: 20,
        //         color: Colors.redAccent,
        //       ),
        //     );
        //   },
        // ),
        BlocListener<TodoListBloc, TodoListState>(
          listener: (context, state) {
            final int activeTodoCount =
                state.todos.where((todo) => !todo.completed).toList().length;

            context.read<ActiveTodoCountBloc>().add(
                CalculateActiveTodoCountEvent(
                    activeTodoCount: activeTodoCount));
          },
          child: Text(
            '${context.watch<ActiveTodoCountBloc>().state.activeTodoCount} items',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.redAccent,
            ),
          ),
        ),
      ],
    );
  }
}
