import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'todo_search_event.dart';
part 'todo_search_state.dart';

class TodoSearchBloc extends Bloc<TodoSearchEvent, TodoSearchState> {
  TodoSearchBloc() : super(TodoSearchState.inital()) {
    on<SetSearchTextEvent>((event, emit) {
      emit(state.copyWith(searchText: event.newSearchText));
    }, transformer: debounce(const Duration(milliseconds: 1000)));
  }

//Below  is  for debounce for search
  EventTransformer<SetSearchTextEvent> debounce<SetSearchTextEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
