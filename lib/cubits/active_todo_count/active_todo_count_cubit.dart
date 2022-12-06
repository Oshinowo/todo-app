// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:todo_app/cubits/todo_list/todo_list_cubit.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  final int initialActiveTodoCount;
  late final StreamSubscription todoListSubscription;
  final TodoListCubit todoListCubit;

  ActiveTodoCountCubit(
    {required this.initialActiveTodoCount,required this.todoListCubit,}
  ) : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount)) {
    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      print('todoListState: $todoListState');

      final int currentActiveTodoCount =
          todoListState.todos.where((todo) => !todo.completed).toList().length;

      emit(state.copyWith(activeTodoCount: currentActiveTodoCount));
    });
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
