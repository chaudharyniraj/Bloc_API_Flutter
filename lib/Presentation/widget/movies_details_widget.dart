import 'package:api_bloc_flutter/Model/Movies_model/movies_model.dart';
import 'package:api_bloc_flutter/bloc/movies/movies_details/movies_details_bloc.dart';
import 'package:api_bloc_flutter/bloc/movies/movies_details/movies_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesDetailsWidget extends StatelessWidget {
  const MoviesDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: BlocBuilder<MoviesDetailsBloc, MoviesState>(
            builder: ((context, state) {
              if (state is ErrorsState) {
                return Text(state.message);
              } else if (state is MovieDetailsState) {
                return buildMovieDetailsWidget(context, state.movieDetails);
              }
              return const Center(child: CircularProgressIndicator());
            }),
          ),
        ),
      ),
    );
  }
}

backgroundImage(MoviesModel movieDetails, context) {
  try {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Image(
        image: NetworkImage(movieDetails.background_image),
        fit: BoxFit.cover,
      ),
    );
  } catch (e) {
    return Container(
      color: Colors.purpleAccent,
    );
  }
}

buildMovieDetailsWidget(BuildContext context, MoviesModel movieDetails) {
  TextStyle _textStyleInsideStack = const TextStyle(
      color: Colors.lightGreenAccent,
      fontWeight: FontWeight.bold,
      fontSize: 16);
  TextStyle _textStyleOutsideStack = const TextStyle(
      color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16);
  return Column(
    children: [
      Stack(
        alignment: Alignment.bottomRight,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
              child: backgroundImage(movieDetails, context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image(
                  image: NetworkImage(movieDetails.medium_cover_image),
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movieDetails.title_english.toString(),
                      style: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      "Rating: ${movieDetails.rating.toString()}",
                      style: _textStyleInsideStack,
                    ),
                    Text(
                      "Year: ${movieDetails.year}",
                      style: _textStyleInsideStack,
                    ),
                    Text(
                      "Genres: ${movieDetails.genres}",
                      style: _textStyleInsideStack,
                    ),
                    Text(
                      "Language: ${movieDetails.language}",
                      style: _textStyleInsideStack,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Runtime: ${movieDetails.runtime}",
              style: _textStyleOutsideStack,
            ),
            Text(
              "Uploaded Date: ${movieDetails.date_uploaded}",
              style: _textStyleOutsideStack,
            ),
            buildTorrentsDownloadWidget(movieDetails),
            const Text(
              "Details",
              style: TextStyle(
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
            Text(
              movieDetails.description_full.toString(),
            )
          ],
        ),
      ),
    ],
  );
}

buildTorrentsDownloadWidget(MoviesModel movieDetails) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: movieDetails.torrents.length,
      itemBuilder: (context, index) {
        return Card(
            color: Colors.limeAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Quality: ${movieDetails.torrents[index].quality}"),
                      Text("Type: ${movieDetails.torrents[index].type}"),
                      Text("Seeds: ${movieDetails.torrents[index].seeds}"),
                      Text("Peers: ${movieDetails.torrents[index].peers}"),
                      Text("Size: ${movieDetails.torrents[index].size}"),
                      Text(
                          "Date Uploaded ${movieDetails.torrents[index].date_uploaded}")
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      movieDetails.torrents[index].url;
                    },
                    color: Colors.green,
                    icon: const Icon(Icons.download))
              ],
            ));
      });
}
