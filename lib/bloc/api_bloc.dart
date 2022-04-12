import 'package:api_bloc_flutter/Manager/manager.dart';
import 'package:api_bloc_flutter/Model/resource_model.dart';
import 'package:api_bloc_flutter/Model/user_model.dart';
import 'package:bloc/bloc.dart';

import 'api_event.dart';
import 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final Manager _manager;
  // final ResourceManager _resourceManager;

  ApiBloc(this._manager) : super(InitialState()) {
    on<UserEvent>((event, emit) async {
      try {
        // final model = await _userManager.getUserData();
        List<UserModel> datas = await _manager.getUserData();
        emit(UserLoadedState(userData: datas));
      } catch (e) {
        emit(ErrorState(message: e.toString()));
      }
    });
    on<ResourceEvent>((event, emit) async {
      try {
        List<ResourceModel> datas = await _manager.getResourceData();
        emit(ResourcesLoadedState(resourceData: datas));
      } catch (e) {
        emit(ErrorState(message: e.toString()));
      }
    });
  }
}
