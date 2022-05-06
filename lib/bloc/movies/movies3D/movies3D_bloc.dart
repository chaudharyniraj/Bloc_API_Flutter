// ignore_for_file: file_names

import 'package:api_bloc_flutter/bloc/movies/movies3D/movies3D_event.dart';
import 'package:api_bloc_flutter/bloc/movies/movies3D/movies3D_state.dart';
import 'package:bloc/bloc.dart';

import '../../../Model/Movies_model/movies_model.dart';
import '../../../UrlManager/movies_manager.dart';

class Movies3DBloc extends Bloc<Movies3DEvent, Movies3DState> {
  final MoviesManager _moviesManager = MoviesManager();
  Movies3DBloc() : super(InitialState()) {
    on<MoviesEvent3D>((event, emit) async {
      try {
        List<MoviesModel> moviesDatas3D =
            await _moviesManager.getMoviesList3D();
        emit(Movies3DLoadedState(moviesData3D: moviesDatas3D));
      } catch (e) {
        emit(Movie3DErrorsState(message: e.toString()));
      }
    });
  }
}
