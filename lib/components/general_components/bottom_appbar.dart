import 'package:flutter/material.dart';
import 'package:app_innove/utils/cache.dart';

class BottomAppBarComponentized extends StatelessWidget {
  const BottomAppBarComponentized({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.redAccent,
      height: 50,
      shape: CircularNotchedRectangle(),
      elevation: 15,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.folder),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/contracts');
            },
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              deleteFile('token');
              Navigator.of(context).pushReplacementNamed('/');
            },
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
