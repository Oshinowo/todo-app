// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_search_bloc.dart';

abstract class TodoSearchEvent extends Equatable {
  const TodoSearchEvent();

  @override
  List<Object> get props => [];
}

class SetSearchTermEvent extends TodoSearchEvent {
  final String searchTerm;

  SetSearchTermEvent({required this.searchTerm});
  

  @override
  String toString() => 'SetSearchTermEvent(searchTerm: $searchTerm)';

    @override
  List<Object> get props => [searchTerm];
}
