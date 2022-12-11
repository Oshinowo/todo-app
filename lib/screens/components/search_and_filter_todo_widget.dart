import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/blocs.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/utils/debounce.dart';

class SearchAndFilterTodo extends StatefulWidget {
  const SearchAndFilterTodo({super.key});

  @override
  State<SearchAndFilterTodo> createState() => _SearchAndFilterTodoState();
}

class _SearchAndFilterTodoState extends State<SearchAndFilterTodo> {
  final _searchController = TextEditingController();
  // final debounce = Debounce(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            filled: true,
            border: InputBorder.none,
            labelText: 'Search Todos...',
            prefixIcon: Icon(
              Icons.search,
            ),
          ),
          onChanged: (newSearchTerm) {
            if (newSearchTerm != '') {
              // debounce.run(() {
                context
                    .read<TodoSearchBloc>()
                    .add(SetSearchTermEvent(searchTerm: newSearchTerm));
              // });
            }
          },
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context, Filter.completed),
          ],
        )
      ],
    );
  }

  Widget filterButton(BuildContext context, Filter filter) {
    return TextButton(
      onPressed: () {
        context
            .read<TodoFilterBloc>()
            .add(ChangeFilterEvent(newFilter: filter));
      },
      child: Text(
        filter == Filter.all
            ? 'All'
            : filter == Filter.active
                ? 'Active'
                : 'Completed',
        style: TextStyle(
          fontSize: 18.0,
          color: context.watch<TodoFilterBloc>().state.filter == filter
              ? Colors.blue
              : Colors.grey,
        ),
      ),
    );
  }
}
