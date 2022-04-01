/// Enum to hold the possible errors on login
enum LoginErrors {
  none,
  invalidEmail,
  invalidPassword,
}

/// Login State class to hold the state of login page
///
class LoginState {
  LoginState({
    required this.isLoading,
    required this.canLogin,
    required this.loginErrorType,
  });

  /// The initial state
  ///
  factory LoginState.initial() => LoginState(
        isLoading: false,
        canLogin: false,
        loginErrorType: LoginErrors.none,
      );

  /// State that indicate if the UI is loading
  /// waiting for some data
  ///
  factory LoginState.isLoading() => LoginState(
        isLoading: true,
        canLogin: false,
        loginErrorType: LoginErrors.none,
      );

  /// State that indicate the user credentials are valid
  /// and can login with success
  ///
  factory LoginState.success() => LoginState(
        isLoading: false,
        canLogin: true,
        loginErrorType: LoginErrors.none,
      );

  /// State that indicate error when something is wrong with
  /// user credentials, either email or password
  ///
  factory LoginState.error({
    required LoginErrors errorType,
  }) =>
      LoginState(
        isLoading: false,
        canLogin: false,
        loginErrorType: errorType,
      );

  final bool isLoading;
  final bool canLogin;
  final LoginErrors loginErrorType;
}
