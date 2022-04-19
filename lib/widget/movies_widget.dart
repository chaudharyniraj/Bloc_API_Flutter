import 'package:api_bloc_flutter/bloc/api_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/api_bloc.dart';
import '../bloc/api_state.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ApiBloc>(
        create: (context) => ApiBloc()..add(MoviesEvent()),
        child: BlocBuilder<ApiBloc, ApiState>(builder: ((context, state) {
          if (state is ErrorState) {
            return Text(state.message);
          } else if (state is MoviesLoadedState) {
            // return buildResourceInfoWidget(state.moviesData);
          }
          return const Center(child: CircularProgressIndicator());
        })),
      ),
    );
  }
}
