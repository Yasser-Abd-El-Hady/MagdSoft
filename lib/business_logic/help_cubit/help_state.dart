part of 'help_cubit.dart';

@immutable
abstract class HelpState {}

class HelpInitial extends HelpState {}

class FetchedState extends HelpState {
  final String message;
  FetchedState(this.message);
}

class ErrorState extends HelpState {
  final String errorMessage;
  ErrorState(this.errorMessage);
}
