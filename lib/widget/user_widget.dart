import 'package:api_bloc_flutter/Model/user_model.dart';
import 'package:api_bloc_flutter/bloc/api_bloc.dart';
import 'package:api_bloc_flutter/bloc/api_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/api_event.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
      ),
      body: BlocProvider<ApiBloc>(
        create: (context) => ApiBloc()..add(UserEvent()),
        child: BlocBuilder<ApiBloc, ApiState>(builder: ((context, state) {
          if (state is ErrorState) {
            return Text(state.message);
          } else if (state is UserLoadedState) {
            return buildUserInfoWidget(state.userData);
          }
          return const Center(child: CircularProgressIndicator());
        })),
      ),
    );
  }

  buildUserInfoWidget(List<UserModel> userData) {
    // String body = json.encode(userData.toMap());
    return ListView.builder(
        itemCount: userData.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
            child: buildEachUserWidget(userData, index),
          );
        });
  }
}

buildEachUserWidget(List<UserModel> userData, index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
              userData[index].userAvatar,
              width: 100,
            )),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Expanded(
                flex: 1,
                child: Text(
                  "Id:",
                  style: TextStyle(color: Colors.green, fontSize: 16.0),
                )),
            Expanded(
                flex: 1,
                child: Text(userData[index].userId.toString(),
                    style: const TextStyle(fontSize: 16.0)))
          ],
        ),
        Row(
          children: [
            const Expanded(
                flex: 1,
                child: Text(
                  "Email:",
                  style: TextStyle(color: Colors.green, fontSize: 16.0),
                )),
            Expanded(
                flex: 1,
                child: Text(userData[index].userEmail,
                    style: const TextStyle(fontSize: 16.0)))
          ],
        ),
        Row(
          children: [
            const Expanded(
                flex: 1,
                child: Text(
                  "Name:",
                  style: TextStyle(color: Colors.green, fontSize: 16.0),
                )),
            Expanded(
                flex: 1,
                child: Text(
                    userData[index].userFirstName +
                        " " +
                        userData[index].userLastName,
                    style: const TextStyle(fontSize: 16.0)))
          ],
        ),
      ],
    ),
  );
}
