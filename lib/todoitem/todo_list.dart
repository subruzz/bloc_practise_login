import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/todoitem/bloc/todo_block.dart';
import 'package:flutter_bloc_sample/todoitem/cubit/todo_cubit.dart';
import 'package:flutter_bloc_sample/todoitem/todo_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: BlocBuilder<TodoBlock, List<ToDo>>(
        builder: (context, todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final currentTodo = todos[index];
              return ListTile(
                title: Text(currentTodo.title),
                subtitle: Text(currentTodo.createdAt.toIso8601String()),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
