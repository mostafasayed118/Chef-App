sealed class SignInState {}

final class LoginInitial extends SignInState {}

final class LoginLoadingState extends SignInState {}

final class LoginErrorState extends SignInState {
  final String message;

  LoginErrorState(
    this.message,
  );
}

final class LoginSuccessState extends SignInState {}

final class LoginPasswordVisibilityStateLoading extends SignInState {}

final class LoginPasswordVisibilityStateSuccess extends SignInState {}
