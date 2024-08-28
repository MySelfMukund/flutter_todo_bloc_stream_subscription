// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filtered_todos_bloc.dart';

sealed class FilteredTodosEvent extends Equatable {
  const FilteredTodosEvent();

  @override
  List<Object> get props => [];
}

class CalculateFilteredTodoEvent extends FilteredTodosEvent {
  final List<Todo> filteredTodos;

  const CalculateFilteredTodoEvent({required this.filteredTodos});

  @override
  String toString() => 'CalculateFilteredTodoEvent(filteredTodos: $filteredTodos)';
}
