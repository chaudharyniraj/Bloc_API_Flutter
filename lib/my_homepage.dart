import 'package:api_bloc_flutter/bloc/api_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/api_event.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: MaterialButton(
              onPressed: () {
                BlocProvider.of<ApiBloc>(context, listen: false)
                    .add(UserEvent());
              },
              color: Colors.green,
              child: const Text(
                'User Info',
                style: TextStyle(color: Colors.white),
              ))),
    );
  }
}
