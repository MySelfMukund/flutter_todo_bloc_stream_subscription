import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_bloc_streamsubscription/presentations/todo_page.dart';
import 'package:flutter_todo_bloc_streamsubscription/utils/app_bloc_observer.dart';
import 'blocs/blocs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoListBloc>(
          create: (context) => TodoListBloc(),
        ),
        BlocProvider<TodoFilterBloc>(
          create: (context) => TodoFilterBloc(),
        ),
        BlocProvider<TodoSearchBloc>(
          create: (context) => TodoSearchBloc(),
        ),
        BlocProvider<ActiveTodoCountBloc>(
          create: (context) => ActiveTodoCountBloc(
              initialActiveTodocount: context.read<TodoListBloc>().state.todos.length,
              todoListBloc: BlocProvider.of<TodoListBloc>(context)),
        ),
        BlocProvider<TodoSearchBloc>(
          create: (context) => TodoSearchBloc(),
        ),
        BlocProvider<FilteredTodosBloc>(
            create: (context) => FilteredTodosBloc(
                initialTodos: context.read<TodoListBloc>().state.todos,
                todoFilterBloc: BlocProvider.of<TodoFilterBloc>(context),
                todoListBloc: BlocProvider.of<TodoListBloc>(context),
                todoSearchBloc: BlocProvider.of<TodoSearchBloc>(context)))
      ],
      child: MaterialApp(
        title: 'ToDo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: TodoPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
