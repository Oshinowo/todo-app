import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/models/todo.dart';

part 'filtered_todo_event.dart';
part 'filtered_todo_state.dart';

class FilteredTodoBloc extends Bloc<FilteredTodoEvent, FilteredTodoState> {
  final List<Todo> initialTodos;

  FilteredTodoBloc({
    required this.initialTodos,
  }) : super(FilteredTodoState(filteredTodos: initialTodos)) {
    on<CalculateFilteredTodoEvent>((event, emit) {
      emit(state.copyWith(filteredTodos: event.filteredTodos));
    });
  }
}
