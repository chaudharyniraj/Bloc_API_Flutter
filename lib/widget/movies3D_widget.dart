import 'package:api_bloc_flutter/bloc/api_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Model/Movies_model/movies_list_model.dart';
import '../bloc/api_bloc.dart';
import '../bloc/api_state.dart';

class Movies3DWidget extends StatelessWidget {
  const Movies3DWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ApiBloc>(
        create: (context) => ApiBloc()..add(MoviesEvent3D()),
        child: BlocBuilder<ApiBloc, ApiState>(builder: ((context, state) {
          if (state is ErrorState) {
            return Text(state.message);
          } else if (state is Movies3DLoadedState) {
            // return const Text("data");
            return buildMovie3DListWidget(context, state.moviesData3D);
          }
          return const Center(child: CircularProgressIndicator());
        })),
      ),
    );
  }
}

buildMovie3DListWidget(BuildContext context, List<MoviesListModel> moviesData) {
  TextStyle _textStyle = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber);
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemCount: moviesData.length,
      itemBuilder: (context, index) {
        return Container(
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
              Text(
                moviesData[index].rating.toString(),
                style: _textStyle,
              )
            ],
          ),
        );
      });
}
