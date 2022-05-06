import 'package:api_bloc_flutter/Model/Movies_model/suggested_movies/suggested_movies_model.dart';
import 'package:api_bloc_flutter/bloc/api_event.dart';
import 'package:api_bloc_flutter/bloc/api_state.dart';
import 'package:bloc/bloc.dart';
import '../../UrlManager/movies_manager.dart';

class SuggestedMoviesBloc extends Bloc<ApiEvent, ApiState> {
  final MoviesManager _moviesManager = MoviesManager();
  SuggestedMoviesBloc() : super(InitialState()) {
    on<SuggestedMoviesEvent>((event, emit) async {
      // print('hey');
      try {
        List<SuggestedMoviesModel> moviesDatas =
            await _moviesManager.getSuggestedMoviesList();
        emit(SuggestedMoviesLoadedState(suggestedMoviesData3: moviesDatas));
      } catch (e) {
        emit(ErrorState(message: e.toString()));
      }
    });
  }
}
