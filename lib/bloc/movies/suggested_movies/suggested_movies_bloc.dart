import 'package:api_bloc_flutter/Model/Movies_model/suggested_movies/suggested_movies_model.dart';
import 'package:api_bloc_flutter/bloc/movies/suggested_movies/suggested_movies_event.dart';
import 'package:api_bloc_flutter/bloc/movies/suggested_movies/suggested_movies_state.dart';
import 'package:bloc/bloc.dart';
import '../../../UrlManager/movies_manager.dart';

class SuggestedMoviesBloc
    extends Bloc<SuggestedMoviesEvent, SuggestedMoviesState> {
  final MoviesManager _moviesManager = MoviesManager();
  SuggestedMoviesBloc() : super(InitialState()) {
    on<SuggestedMoviesEvent>((event, emit) async {
      // print('hey');
      try {
        List<SuggestedMoviesModel> moviesDatas =
            await _moviesManager.getSuggestedMoviesList();
        emit(SuggestedMoviesLoadedState(suggestedMovies: moviesDatas));
      } catch (e) {
        emit(SuggestedMoviesErrorState(message: e.toString()));
      }
    });
  }
}
