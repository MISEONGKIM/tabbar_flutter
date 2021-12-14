import 'package:flutter/material.dart';

import 'animal.dart';

class SecondApp extends StatelessWidget {
  final List<Animal> list;
 SecondApp({Key? key, required this.list}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('두번째 페이지'),
        ),
      ),
    );
  }
}