import 'package:api_bloc_flutter/bloc/api_state.dart';
import 'package:api_bloc_flutter/bloc/movies_bloc.dart/suggested_movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggectedMoviesWidget extends StatelessWidget {
  const SuggectedMoviesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SuggestedMoviesBloc, ApiState>(
          builder: ((context, state) {
        if (state is ErrorState) {
          // return Text(state.message);
        } else if (state is SuggestedMoviesLoadedState) {
          return Text(state.suggestedMoviesData3.toString());
        }
        return const Center(child: CircularProgressIndicator());
      })),
    );
  }
}
