import 'package:api_bloc_flutter/bloc/api_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/api_bloc.dart';
import '../../bloc/api_event.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Register',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email address',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  email = value;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  // labelStyle: TextStyle(color: Color(0xff151b8d)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    ),
                  ),
                ),
                obscureText: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  password = value;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: MaterialButton(
                  onPressed: () {
                    context
                        .read<ApiBloc>()
                        .add(RegisterEvent(email: email, password: password));
                  },
                  color: Colors.green,
                  child: const Text('Register'),
                ),
              ),
              BlocBuilder<ApiBloc, ApiState>(
                builder: (context, state) {
                  if (state is ErrorState) {
                    return Text(state.message);
                  } else if (state is ResponseState) {
                    return Center(
                      child: Text(
                        "Login Successful.\n"
                        "your token is: ${state.token}",
                        style:
                            const TextStyle(fontSize: 20, color: Colors.green),
                      ),
                    );
                  }
                  // else {
                  //   return const Center(
                  //     child: Text(
                  //       "Loading...",
                  //       style: TextStyle(fontSize: 20, color: Colors.red),
                  //     ),
                  //   );
                  // }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
