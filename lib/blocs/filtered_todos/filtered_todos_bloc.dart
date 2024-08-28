import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_todo_bloc_streamsubscription/blocs/blocs.dart';

import '../../models/todo_model.dart';

part 'filtered_todos_event.dart';
part 'filtered_todos_state.dart';

class FilteredTodosBloc extends Bloc<FilteredTodosEvent, FilteredTodosState> {
  late StreamSubscription todoListSubscription;
  late StreamSubscription todoSearchSubscription;
  late StreamSubscription todoFilterSubscription;

  final List<Todo> initialTodos;

  final TodoListBloc todoListBloc;
  final TodoSearchBloc todoSearchBloc;
  final TodoFilterBloc todoFilterBloc;

  FilteredTodosBloc(
      {required this.initialTodos, required this.todoFilterBloc, required this.todoListBloc, required this.todoSearchBloc})
      : super(FilteredTodosState(filteredTodos: initialTodos)) {
    todoListSubscription = todoListBloc.stream.listen((TodoListState todoListState) {
      setFilteredTodos();
    });
    todoSearchSubscription = todoSearchBloc.stream.listen((TodoSearchState todoSearchState) {
      setFilteredTodos();
    });

    todoFilterSubscription = todoFilterBloc.stream.listen((TodoFilterState todoFilterState) {
      setFilteredTodos();
    });

    on<CalculateFilteredTodoEvent>((event, emit) {
      emit(state.copyWith(filteredTodos: event.filteredTodos));
    });
  }

  void setFilteredTodos() {
    List<Todo> _filteredTodos;

    switch (todoFilterBloc.state.filter) {
      case Filter.active:
        _filteredTodos = todoListBloc.state.todos.where((Todo todo) => !todo.isCompleted).toList();
        break;

      case Filter.completed:
        _filteredTodos = todoListBloc.state.todos.where((Todo todo) => todo.isCompleted).toList();
      case Filter.all:
      default:
        _filteredTodos = todoListBloc.state.todos;
    }
    if (todoSearchBloc.state.searchText.isNotEmpty) {
      _filteredTodos =
          _filteredTodos.where((Todo todo) => todo.desc.toLowerCase().contains(todoSearchBloc.state.searchText)).toList();
    }

    add(CalculateFilteredTodoEvent(filteredTodos: _filteredTodos));
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    todoFilterSubscription.cancel();
    todoSearchSubscription.cancel();
    return super.close();
  }
}
