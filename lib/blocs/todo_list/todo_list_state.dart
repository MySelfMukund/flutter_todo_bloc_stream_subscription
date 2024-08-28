// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_list_bloc.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;

  const TodoListState({
    required this.todos,
  });

  factory TodoListState.initial() => TodoListState(todos: [
        Todo(id: '1', desc: 'Read', isCompleted: false),
        Todo(id: '2', desc: 'Washing clothes', isCompleted: false),
        Todo(id: '3', desc: 'Clean Brushes', isCompleted: false),
      ]);

  @override
  List<Object> get props => [todos];

  @override
  bool get stringify => true;

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }
}
