import 'package:animal_spirit_app/bloc/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// The cubit class to manage the state of Login Page
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());
}

/// Function to validate user credentials and login
///
void login({
  required String email,
  required String password,
}) {
  /// Simple email verification to see if is valid
  /// if not valid emit State error of type InvalidEmail
  if (!email.contains('@') || email.length < 5) {
    // emit(LoginState.error(errorType: LoginErrors.invalidEmail));
  }

  // /// Simple password verification to see if is valid
  // /// if not valid emit State error of type InvalidPassword
  // else if (password.isEmpty || password.length < 4) {
  //   emit(LoginState.error(errorType: LoginErrors.invalidPassword));
  // }

  // /// If all validations passed, emit state of success
  // else {
  //   emit(LoginState.success());
  // }
}
