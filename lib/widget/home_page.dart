import 'package:api_bloc_flutter/widget/resource_widget.dart';
import 'package:api_bloc_flutter/widget/user_widget.dart';
import 'package:flutter/material.dart';

import 'register_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Resource',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Register',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    UserWidget(),
    ResourceWidget(),
    // BlocProvider<ApiBloc>(
    //     create: (context) => ApiBloc(), child: RegisterWidget()),
    RegisterWidget(),
  ];
}
