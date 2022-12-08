import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/cubits.dart';
import 'package:todo_app/models/todo.dart';

class ShowTodo extends StatelessWidget {
  const ShowTodo({super.key});

  @override
  Widget build(BuildContext context) {
    final filteredTodos =
        context.watch<FilteredTodoCubit>().state.filteredTodos;
    return MultiBlocListener(
      listeners: [
        BlocListener<TodoListCubit, TodoListState>(
          listener: (context, state) {
            context.read<FilteredTodoCubit>().setFilteredTodos(
                context.read<TodoFilterCubit>().state.filter,
                state.todos,
                context.read<TodoSearchCubit>().state.searchTerm);
          },
        ),
        BlocListener<TodoFilterCubit, TodoFilterState>(
          listener: (context, state) {
            context.read<FilteredTodoCubit>().setFilteredTodos(
                state.filter,
                context.read<TodoListCubit>().state.todos,
                context.read<TodoSearchCubit>().state.searchTerm);
          },
        ),
        BlocListener<TodoSearchCubit, TodoSearchState>(
          listener: (context, state) {
            context.read<FilteredTodoCubit>().setFilteredTodos(
                context.read<TodoFilterCubit>().state.filter,
                context.read<TodoListCubit>().state.todos,
                state.searchTerm);
          },
        )
      ],
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context, index) => Dismissible(
          key: ValueKey(filteredTodos[index].id),
          background: const ShowBackground(
            direction: 0,
          ),
          secondaryBackground: const ShowBackground(
            direction: 1,
          ),
          onDismissed: (_) {
            context.read<TodoListCubit>().removeTodo(filteredTodos[index]);
          },
          confirmDismiss: (_) {
            return showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text('Are you sure?'),
                      content: const Text(
                        'Do you really want to delete?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('No'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('Yes'),
                        ),
                      ],
                    ));
          },
          child: TodoItem(todo: filteredTodos[index]),
        ),
        separatorBuilder: (context, index) => const Divider(
          height: 2,
          color: Colors.grey,
        ),
        itemCount: filteredTodos.length,
      ),
    );
  }
}

class ShowBackground extends StatelessWidget {
  const ShowBackground({super.key, required this.direction});

  final int direction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      color: Colors.red,
      child: const Icon(
        Icons.delete,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.todo});

  final Todo todo;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  final _editTextController = TextEditingController();

  @override
  void dispose() {
    _editTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              bool error = false;
              _editTextController.text = widget.todo.desc;

              return AlertDialog(
                title: const Text('Edit Todo'),
                content: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return TextField(
                    controller: _editTextController,
                    autofocus: true,
                    decoration: InputDecoration(
                      errorText: error ? "Value cannot be empty" : null,
                    ),
                  );
                }),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        error = _editTextController.text.isEmpty ? true : false;
                      });
                      if (!error) {
                        context.read<TodoListCubit>().editTodos(
                              widget.todo.id,
                              _editTextController.text,
                            );
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Edit'),
                  ),
                ],
              );
            });
      },
      leading: Checkbox(
          value: widget.todo.completed,
          onChanged: (isChecked) {
            context.read<TodoListCubit>().toggleTodo(widget.todo.id);
          }),
      title: Text(
        widget.todo.desc,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
