import 'package:api_bloc_flutter/Presentation/widget/movies3D_widget.dart';
import 'package:api_bloc_flutter/Presentation/widget/movies_list_widget.dart';

import 'package:flutter/material.dart';

class TabbarWidget extends StatelessWidget {
  const TabbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.movie)),
              Text("3D"),
            ],
          ),
          title: const Text('Movies'),
        ),
        body: const TabBarView(
          children: [MoviesListWidget(), Movies3DWidget()],
        ),
      ),
    );
  }
}
