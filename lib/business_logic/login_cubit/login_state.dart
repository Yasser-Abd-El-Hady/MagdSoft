part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

/// this state emit at the time which app try fetch or post data
/// to backend
class LoadingState extends LoginState {}

/// this state emit if operation done Successfully
class LoginSuccess extends LoginState {
  final String message;
  LoginSuccess(this.message);
}

/// this state emit if error occured
class LoginFailure extends LoginState {
  final String errorMessage;
  LoginFailure(this.errorMessage);
}
