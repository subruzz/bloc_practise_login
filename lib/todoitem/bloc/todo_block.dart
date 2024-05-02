import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/todoitem/todo_model.dart';

class AddTodoEvent {
  final ToDo todo;

  AddTodoEvent(this.todo);
}

class TodoBlock extends Bloc<AddTodoEvent, List<ToDo>> {
  TodoBlock() : super([]) {
    on<AddTodoEvent>((event, emit) {
      emit([
        ...state,event.todo
      ]);
    });
  }
}
