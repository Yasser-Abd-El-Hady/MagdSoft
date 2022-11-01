part of 'verification_cubit.dart';

@immutable
abstract class VerificationState {}

class VerificationInitial extends VerificationState {}

class VLoadingState extends VerificationState {}

class ResendingState extends VerificationState {}

class VerificationSuccess extends VerificationState {
  final String message;
  VerificationSuccess(this.message);
}

class VerificationFailed extends VerificationState {
  final String errorMessage;
  VerificationFailed(this.errorMessage);
}
