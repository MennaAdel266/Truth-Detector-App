abstract class SignupStates {}

class SignupInitialState extends SignupStates{}

class SignupLoadingState extends SignupStates{}

class SignupSuccessState extends SignupStates {}

class SignupErrorState extends SignupStates
{
  final String error;

  SignupErrorState(this.error);
}

class CreateUserSuccessState extends SignupStates {}

class CreateUserErrorState extends SignupStates
{
  final String error;

  CreateUserErrorState(this.error);
}

class SignupChangePasswordState extends SignupStates{}