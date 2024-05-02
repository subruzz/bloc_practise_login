import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginClickEvent>(_onAuthRequested);
  }
  void _onAuthRequested(LoginClickEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      if (event.password.length < 6) {
        emit(AuthFailed(err: 'password cant be less than 6'));
        return;
      }
      await Future.delayed(const Duration(seconds: 5));
      emit(AuthSuccess(event.email));
    } catch (e) {
      emit(AuthFailed(err: e.toString()));
    }
  }
}
