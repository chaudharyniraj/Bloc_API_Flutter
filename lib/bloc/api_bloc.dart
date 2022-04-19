import 'dart:developer';

import 'package:api_bloc_flutter/Manager/manager.dart';
import 'package:api_bloc_flutter/Manager/movies_manager.dart';
import 'package:api_bloc_flutter/Model/Movies_model/movies_list_model.dart';
import 'package:api_bloc_flutter/Model/resource_model.dart';
import 'package:api_bloc_flutter/Model/user_model.dart';
import 'package:api_bloc_flutter/Model/user_register_model.dart';
import 'package:bloc/bloc.dart';

import 'api_event.dart';
import 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final Manager _manager = Manager();
  final MoviesManager _moviesManager = MoviesManager();

  UserRegisterModel uData = UserRegisterModel();

  ApiBloc() : super(InitialState()) {
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
    on<RegisterEvent>((event, emit) async {
      uData.email = event.email;
      uData.password = event.password;
      try {
        String token = await _manager.registerUser(uData);
        log(token);
        emit(ResponseState(token: token));
      } catch (e) {
        emit(ErrorState(message: e.toString()));
      }
      // RegisterState(email: event.email, password: event.password);
    });

    on<MoviesEvent>((event, emit) async {
      try {
        List<MoviesListModel> moviesDatas =
            await _moviesManager.getMoviesList();
        emit(MoviesLoadedState(moviesData: moviesDatas));
      } catch (e) {
        emit(ErrorState(message: e.toString()));
      }
    });
  }
}
