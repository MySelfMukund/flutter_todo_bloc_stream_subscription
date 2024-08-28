import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_bloc_streamsubscription/blocs/blocs.dart';

import '../../models/todo_model.dart';

class SearchAndFilterTodo extends StatelessWidget {
  const SearchAndFilterTodo({super.key});
  // final debounce = Debounce(miliSeconds: 1000);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
              labelText: 'Search Todo...', border: InputBorder.none, filled: true, prefix: Icon(Icons.search)),
          onChanged: (String newSearchString) {
            // ignore: unnecessary_null_comparison
            if (newSearchString != null) {
              //desabled the below debouncer because it is already added in the  bloc  itself as EvenTranformer.
              // debounce.run(() {
              context.read<TodoSearchBloc>().add(SetSearchTextEvent(newSearchText: newSearchString));
              // });
            }
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context, Filter.completed),
          ],
        )
      ],
    );
  }

  Widget filterButton(BuildContext context, Filter filter) {
    return TextButton(
      onPressed: () {
        context.read<TodoFilterBloc>().add(ChangeFilterEvent(newFilter: filter));
      },
      child: Text(
          filter == Filter.all
              ? 'All'
              : filter == Filter.active
                  ? 'Active'
                  : 'Completed',
          style: TextStyle(fontSize: 18.0, color: textColor(context, filter))),
    );
  }

  Color textColor(BuildContext context, Filter filter) {
    final currentFilterValue = context.watch<TodoFilterBloc>().state.filter;
    return currentFilterValue == filter ? Colors.blue : Colors.grey;
  }
}
