// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_search_bloc.dart';

class TodoSearchState extends Equatable {
  final String searchText;

  const TodoSearchState(
    this.searchText,
  );
  factory TodoSearchState.inital() {
    return const TodoSearchState('');
  }

  @override
  bool get stringify => true;

  TodoSearchState copyWith({
    String? searchText,
  }) {
    return TodoSearchState(
      searchText ?? this.searchText,
    );
  }

  @override
  List<Object> get props => [searchText];
}
