import 'package:api_bloc_flutter/bloc/movies/movies_list/movies_list_event.dart';
import 'package:api_bloc_flutter/bloc/movies/movies_list/movies_list_state.dart';
import 'package:bloc/bloc.dart';

import '../../../Model/Movies_model/movies_model.dart';
import '../../../UrlManager/movies_manager.dart';

class MoviesListBloc extends Bloc<MoviesListEvent, MoviesListState> {
  final MoviesManager _moviesManager = MoviesManager();
  MoviesListBloc() : super(InitialState()) {
    on<MoviesListLoadedEvent>((event, emit) async {
      try {
        List<MoviesModel> moviesDatas = await _moviesManager.getMoviesList();
        emit(MoviesLoadedState(moviesData: moviesDatas));
      } catch (e) {
        emit(MovieListErrorsState(message: e.toString()));
      }
    });
  }
}
