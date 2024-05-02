import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/todoitem/todo_model.dart';

class TodoCubit extends Cubit<List<ToDo>> {
  TodoCubit() : super([]);
  void addTodo(ToDo todo) {
    addError('error');
    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<ToDo>> change) {
    print(change);
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}
