// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_search_bloc.dart';

abstract class TodoSearchEvent extends Equatable {
  const TodoSearchEvent();

  @override
  List<Object> get props => [];
}

class SetSearchTextEvent extends TodoSearchEvent {
  final String newSearchText;

  const SetSearchTextEvent({required this.newSearchText});

  factory SetSearchTextEvent.initial() => const SetSearchTextEvent(newSearchText: '');

  @override
  String toString() => 'SetSearchTextEvent(newSearchText: $newSearchText)';

  SetSearchTextEvent copyWith({
    String? newSearchText,
  }) {
    return SetSearchTextEvent(
      newSearchText: newSearchText ?? this.newSearchText,
    );
  }

  @override
  List<Object> get props => [newSearchText];
}
