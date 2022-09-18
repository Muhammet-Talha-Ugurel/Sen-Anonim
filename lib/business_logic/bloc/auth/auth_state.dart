abstract class AuthState {}

class AuthenticatedState extends AuthState {}

class UnauthentiactedState extends AuthState {}

class CreatingAcountState extends AuthState{}

class CreatedAcountState extends AuthState{}

class FailedToCreateAcountState extends AuthState{
  Error error;
  FailedToCreateAcountState({required this.error});
}