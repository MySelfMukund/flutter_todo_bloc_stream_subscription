import 'package:flutter/material.dart';

import 'create_todo.dart';
import 'search_and_filter_todo.dart';
import 'show_todos.dart';
import 'todo_header.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key});

  TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const TodoHeader(),
            const CreateTodo(),
            const SizedBox(
              height: 20,
            ),
            SearchAndFilterTodo(),
            const ShowTodos(),
          ],
        ),
      )),
    );
  }
}
