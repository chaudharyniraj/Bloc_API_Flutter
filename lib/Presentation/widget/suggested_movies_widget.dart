import 'package:api_bloc_flutter/bloc/movies/suggested_movies/suggested_movies_bloc.dart';
import 'package:api_bloc_flutter/bloc/movies/suggested_movies/suggested_movies_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggectedMoviesWidget extends StatelessWidget {
  const SuggectedMoviesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SuggestedMoviesBloc, SuggestedMoviesState>(
          builder: ((context, state) {
        if (state is SuggestedMoviesErrorState) {
          // return Text(state.message);
        } else if (state is SuggestedMoviesLoadedState) {
          return Text(state.suggestedMoviesData3.toString());
        }
        return const Center(child: CircularProgressIndicator());
      })),
    );
  }
}
