import 'package:api_bloc_flutter/bloc/api_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          // RepositoryProvider(
          //     create: (_) => Manager(), child: const HomePage())
          BlocProvider<ApiBloc>(
              create: (context) => ApiBloc(), child: const HomePage()),
    );
  }
}
