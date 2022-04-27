import 'package:api_bloc_flutter/Model/Movies_model/movies_list_model.dart';
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
            return buildMovieListWidget(context, state);
          }
          return const Center(child: CircularProgressIndicator());
        })),
      ),
    );
  }

  buildMovieListWidget(BuildContext context, state) {
    List<MoviesListModel> moviesData = state.moviesData;
    TextStyle _textStyle = const TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);
    TextStyle _textStyleHeader = const TextStyle(
        fontSize: 25, fontWeight: FontWeight.bold, color: Colors.deepOrange);
    return ListView.builder(
        itemCount: moviesData.length,
        itemBuilder: (context, index) {
          return Card(
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<ApiBloc>(context, listen: false)
                    .add(MovieDetailsEvent(id: moviesData[index].id));
                // const MoviesDetailsWidget();
                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //     builder: (BuildContext context) =>
                //         const MoviesDetailsWidget()));
              },
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                              image: NetworkImage(
                                  moviesData[index].medium_cover_image),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Text(
                          moviesData[index].rating.toString(),
                          style: _textStyleHeader,
                        )
                      ],
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              moviesData[index].title.toString(),
                              style: _textStyleHeader,
                            ),
                            Text(
                              "Year : ${moviesData[index].year.toString()}",
                              style: _textStyle,
                            ),
                            Text(
                              "Language : ${moviesData[index].language}",
                              style: _textStyle,
                            ),
                            Text(
                              "Generes : ${moviesData[index].genres}",
                              style: _textStyle,
                            ),
                            Text(
                              "runtime : ${moviesData[index].runtime}",
                              style: _textStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
