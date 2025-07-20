import 'package:app_innove/components/general_components/bottom_appbar.dart';
import 'package:app_innove/components/homepage_components/header.dart';
import 'package:app_innove/utils/cache.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      checkLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [HomePageHeader()],
        ),
      ),
      bottomNavigationBar: BottomAppBarComponentized(),
    );
  }
}
