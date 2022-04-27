import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/api_bloc.dart';
import '../bloc/api_state.dart';

class MoviesDetailsWidget extends StatelessWidget {
  const MoviesDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiBloc, ApiState>(
      builder: ((context, state) {
        if (state is ErrorState) {
          return Text(state.message);
        } else if (state is MovieDetailsState) {
          // return const Text("data");
          return buildMovieDetailsWidget(context, state.movieDetails);
        }
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}

buildMovieDetailsWidget(
    BuildContext context, Map<String, dynamic> movieDetails) {
  return const Text('Hello');
}
