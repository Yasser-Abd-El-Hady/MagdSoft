part of 'verification_cubit.dart';

@immutable
abstract class VerificationState {}

class VerificationInitial extends VerificationState {}

/// this state emit at the time which app try fetch or post data
/// to backend
class VLoadingState extends VerificationState {}

/// this state emit if operation done Successfully
class VerificationSuccess extends VerificationState {
  final String message;
  VerificationSuccess(this.message);
}

/// this state emit if error occured
class VerificationFailed extends VerificationState {
  final String errorMessage;
  VerificationFailed(this.errorMessage);
}
