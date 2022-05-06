import 'package:api_bloc_flutter/bloc/api_event.dart';
import 'package:api_bloc_flutter/bloc/api_state.dart';
import 'package:bloc/bloc.dart';

import '../../Model/Movies_model/movies_model.dart';
import '../../UrlManager/movies_manager.dart';

class MoviesListBloc extends Bloc<ApiEvent, ApiState> {
  final MoviesManager _moviesManager = MoviesManager();
  MoviesListBloc() : super(InitialState()) {
    on<MoviesEvent>((event, emit) async {
      try {
        List<MoviesModel> moviesDatas = await _moviesManager.getMoviesList();
        emit(MoviesLoadedState(moviesData: moviesDatas));
      } catch (e) {
        emit(ErrorState(message: e.toString()));
      }
    });
  }
}
