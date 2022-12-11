part of 'filtered_todo_bloc.dart';

class FilteredTodoState extends Equatable {
  final List<Todo> filteredTodos;

  const FilteredTodoState({
    required this.filteredTodos,
  });

  factory FilteredTodoState.initial() {
    return const FilteredTodoState(filteredTodos: []);
  }

  FilteredTodoState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodoState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [filteredTodos];
}
