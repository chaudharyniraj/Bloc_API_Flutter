import 'package:api_bloc_flutter/Model/Movies_model/movies_list_model.dart';
import 'package:api_bloc_flutter/bloc/movies_bloc.dart/movies_details/movies_details_bloc.dart';
import 'package:api_bloc_flutter/bloc/movies_bloc.dart/movies_details/movies_details_event.dart';
import 'package:api_bloc_flutter/bloc/movies_bloc.dart/movies_list_bloc.dart';
import 'package:api_bloc_flutter/widget/movies_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/api_state.dart';

class MoviesListWidget extends StatelessWidget {
  const MoviesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MoviesListBloc, ApiState>(builder: ((context, state) {
        if (state is ErrorState) {
          return Text(state.message);
        } else if (state is MoviesLoadedState) {
          return buildMovieListWidget(context, state);
        }
        return const Center(child: CircularProgressIndicator());
      })),
    );
  }

  buildMovieListWidget(BuildContext context, state) {
    List<MoviesListModel> moviesData = state.moviesData;
    // TextStyle _textStyleHeader = const TextStyle(
    //     fontSize: 25, fontWeight: FontWeight.bold, color: Colors.deepOrange);
    return ListView.builder(
        itemCount: moviesData.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider<MoviesDetailsBloc>(
                            create: ((context) => MoviesDetailsBloc()
                              ..add(MovieDetailsEvent(
                                  id: moviesData[index].id!))),
                            child: const MoviesDetailsWidget(),
                          )));
            },
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Stack(
                children: [
                  SizedBox(
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image:
                            NetworkImage(moviesData[index].medium_cover_image),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
