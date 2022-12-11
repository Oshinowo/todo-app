import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/blocs.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({super.key});

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  final _newTodoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _newTodoController,
      decoration: const InputDecoration(labelText: 'What to do?'),
      onSubmitted: (String? todoDesc) {
        if (todoDesc != null && todoDesc.trim().isNotEmpty) {
          context.read<TodoListBloc>().add(AddTodoEvent(todoDesc: todoDesc));
          _newTodoController.clear();
        }
      },
    );
  }

  @override
  void dispose() {
    _newTodoController.dispose();
    super.dispose();
  }
}
