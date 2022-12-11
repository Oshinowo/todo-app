// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filtered_todo_bloc.dart';

abstract class FilteredTodoEvent extends Equatable {
  const FilteredTodoEvent();

  @override
  List<Object> get props => [];
}

class CalculateFilteredTodoEvent extends FilteredTodoEvent {
  final List<Todo> filteredTodos;
  
  const CalculateFilteredTodoEvent({
    required this.filteredTodos,
  });

  @override
  String toString() => 'CalculateFilteredTodoEvent(filteredTodos: $filteredTodos)';

    @override
  List<Object> get props => [filteredTodos];
}
