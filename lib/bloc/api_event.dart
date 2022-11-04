part of 'api_bloc.dart';

abstract class ApiEvent extends Equatable {
  const ApiEvent();
}

class LoadUserEvent extends ApiEvent {
  @override
  List<Object> get props => [];
}
