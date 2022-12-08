// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_filter_bloc.dart';

abstract class TodoFilterEvent extends Equatable {
  const TodoFilterEvent();

  @override
  List<Object> get props => [];
}

class ChangeFilterEvent extends TodoFilterEvent {
  final Filter newFilter;

  ChangeFilterEvent({required this.newFilter});

  @override
  List<Object> get props => [newFilter];

  @override
  String toString() => 'ChangeFilterEvent(newFilter: $newFilter)';
}
