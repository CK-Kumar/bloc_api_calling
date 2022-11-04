import 'package:bloc/bloc.dart';
import 'package:bloc_api_app/models/user_model.dart';
import 'package:bloc_api_app/repos/repositories.dart';

import 'package:equatable/equatable.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final UserRepository _userRepository;
  ApiBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await _userRepository.getUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
