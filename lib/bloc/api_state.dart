import 'package:bloc_project/models/signup_response_model.dart';


abstract class ApiState{
  const ApiState();

  List<Object?> get props => [];
}

class ApiInitial extends ApiState {}

class ApiLoading extends ApiState {}

class ApiLoaded extends ApiState {
  final List<SignUpResponseModel> signUpResponseModel;
  const ApiLoaded(this.signUpResponseModel);
}

class ApiError extends ApiState {
  final String? message;
  const ApiError(this.message);
}
