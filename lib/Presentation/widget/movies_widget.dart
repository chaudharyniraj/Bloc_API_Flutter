import 'package:api_bloc_flutter/Presentation/widget/movies3D_widget.dart';
import 'package:api_bloc_flutter/Presentation/widget/suggested_movies_widget.dart';
import 'package:api_bloc_flutter/bloc/movies/movies3D_bloc.dart';
import 'package:api_bloc_flutter/bloc/movies/movies_list/movies_list_bloc.dart';
import 'package:api_bloc_flutter/bloc/movies/movies_list/movies_list_event.dart';
import 'package:api_bloc_flutter/bloc/movies/suggested_movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/api_event.dart';

import 'movies_list_widget.dart';

class MoviesWidget extends StatefulWidget {
  const MoviesWidget({Key? key}) : super(key: key);

  @override
  State<MoviesWidget> createState() => _MoviesWidgetState();
}

class _MoviesWidgetState extends State<MoviesWidget> {
  final MoviesListBloc moviesListBloc = MoviesListBloc();
  final Movies3DBloc movies3dBloc = Movies3DBloc();
  final SuggestedMoviesBloc suggestedMoviesBloc = SuggestedMoviesBloc();
  @override
  void initState() {
    suggestedMoviesBloc.add(SuggestedMoviesEvent());
    moviesListBloc.add(MoviesEvent());
    movies3dBloc.add(MoviesEvent3D());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle = const TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueAccent);
    return Scaffold(
      body: SafeArea(
          child: MultiBlocProvider(
        providers: [
          BlocProvider<SuggestedMoviesBloc>(
              create: (context) => suggestedMoviesBloc),
          BlocProvider<MoviesListBloc>(create: (context) => moviesListBloc),
          BlocProvider<Movies3DBloc>(create: (_) => movies3dBloc),
        ],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Expanded(child: SuggectedMoviesWidget()),
            Text(
              'List of Movies',
              style: _textStyle,
            ),
            const Expanded(child: MoviesListWidget()),
            Text(
              'List of 3D Movies',
              style: _textStyle,
            ),
            const Expanded(child: Movies3DWidget())
          ],
        ),
      )),
    );
  }
}
