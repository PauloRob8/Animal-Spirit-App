import 'package:animal_spirit_app/bloc/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Obs: For some reason the import of flutter bloc dint work properly
/// the emit() function wont work and i dint figured out why
/// kinda sad that i dint had time to use a new State Management
/// Spend a lot of time to make it on Bloc :/ ;/
/// But here is the code anyways

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
