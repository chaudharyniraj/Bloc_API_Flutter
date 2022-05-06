import 'package:api_bloc_flutter/Model/Movies_model/movies_model.dart';
import 'package:api_bloc_flutter/UrlManager/movies_manager.dart';
import 'package:api_bloc_flutter/bloc/movies/movies_details/movies_details_event.dart';
import 'package:api_bloc_flutter/bloc/movies/movies_details/movies_details_state.dart';
import 'package:bloc/bloc.dart';

class MoviesDetailsBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesManager _moviesManager = MoviesManager();
  MoviesDetailsBloc() : super(InitialState()) {
    on<MovieDetailsEvent>((event, emit) async {
      // if(event is MovieDetailsEvent){

      // }
      int id = event.id;

      try {
        Map<String, dynamic> movieDetails =
            await _moviesManager.getMovieDetails(id);
        MoviesModel moviedata = MoviesModel.fromJson(movieDetails);
        emit(MovieDetailsState(movieDetails: moviedata));
      } catch (e) {
        emit(ErrorsState(message: e.toString()));
      }
    });
  }
}
