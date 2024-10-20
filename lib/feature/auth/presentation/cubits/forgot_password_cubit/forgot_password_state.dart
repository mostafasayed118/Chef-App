
sealed class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ForgotPasswordLoading extends ForgotPasswordState {}

final class ForgotPasswordSuccess extends ForgotPasswordState {

  final String message;

  ForgotPasswordSuccess(this.message);
}

final class ForgotPasswordError extends ForgotPasswordState {

  final String message;

  ForgotPasswordError(this.message);
}

final class ChangeResetNewPasswordVisibilityStateSuccess extends ForgotPasswordState {}
final class ChangeResetConfirmPasswordVisibilityStateSuccess extends ForgotPasswordState {}
final class ResetPasswordLoading extends ForgotPasswordState {}
final class ResetPasswordError extends ForgotPasswordState {
  final String message;
  ResetPasswordError(this.message);
}
final class ResetPasswordSuccess extends ForgotPasswordState {
   final String message;
  ResetPasswordSuccess(this.message);
}

