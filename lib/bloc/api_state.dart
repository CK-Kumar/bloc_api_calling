part of 'api_bloc.dart';

abstract class ApiState extends Equatable {}

class UserLoadingState extends ApiState {
  @override
  List<Object> get props => [];
}

class UserLoadedState extends ApiState {
  final List<UserModel> users;
  UserLoadedState(this.users);

  @override
  List<Object> get props => [users];
}

class UserErrorState extends ApiState {
  final String error;
  UserErrorState(this.error);
  @override
  List<Object> get props => [error];
}
