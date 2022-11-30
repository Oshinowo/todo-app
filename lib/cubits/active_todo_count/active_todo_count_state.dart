// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'active_todo_count_cubit.dart';

class ActiveTodoCountState {
  final int activeTodoCount;

  ActiveTodoCountState({
    required this.activeTodoCount,
  });

  factory ActiveTodoCountState.initial() {
    return ActiveTodoCountState(activeTodoCount: 0);
  }

  @override
  String toString() => 'ActiveTodoCountState(todoCount: $activeTodoCount)';

  @override
  bool operator ==(covariant ActiveTodoCountState other) {
    if (identical(this, other)) return true;

    return other.activeTodoCount == activeTodoCount;
  }

  @override
  int get hashCode => activeTodoCount.hashCode;

  ActiveTodoCountState copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoCountState(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }
}
