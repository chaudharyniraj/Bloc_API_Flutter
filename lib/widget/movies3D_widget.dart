// ignore_for_file: file_names
import 'package:api_bloc_flutter/bloc/movies_bloc.dart/movies3D_bloc.dart';
import 'package:api_bloc_flutter/bloc/movies_bloc.dart/movies_details/movies_details_bloc.dart';
import 'package:api_bloc_flutter/bloc/movies_bloc.dart/movies_details/movies_details_event.dart';
import 'package:api_bloc_flutter/widget/movies_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Model/Movies_model/movies_list_model.dart';

import '../bloc/api_state.dart';

class Movies3DWidget extends StatelessWidget {
  const Movies3DWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<Movies3DBloc, ApiState>(builder: ((context, state) {
        if (state is ErrorState) {
          return Text(state.message);
        } else if (state is Movies3DLoadedState) {
          // return const Text("data");
          return buildMovie3DListWidget(context, state.moviesData3D);
        }
        return const Center(child: CircularProgressIndicator());
      })),
    );
  }
}

buildMovie3DListWidget(BuildContext context, List<MoviesListModel> moviesData) {
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
                            ..add(
                                MovieDetailsEvent(id: moviesData[index].id!))),
                          child: const MoviesDetailsWidget(),
                        )));
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Stack(
              children: [
                SizedBox(
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: NetworkImage(moviesData[index].medium_cover_image),
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
