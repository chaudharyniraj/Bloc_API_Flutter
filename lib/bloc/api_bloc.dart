import 'package:api_bloc_flutter/Manager/user_manager.dart';
import 'package:api_bloc_flutter/Model/user_model.dart';
import 'package:bloc/bloc.dart';

import 'api_event.dart';
import 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final UserManager _userManager;
  ApiBloc(this._userManager) : super(InitialState()) {
    on<ApiEvent>((event, emit) async {
      try {
        // final model = await _userManager.getUserData();
        List<UserModel> datas = await _userManager.getUserData();
        emit(UserLoadedState(userData: datas));
      } catch (e) {
        emit(UserErrorState(message: e.toString()));
      }
    });
    // on<UserEvent>((event, emit) {
    //   // emit(UserState(uData: ));
    // });
  }
}
