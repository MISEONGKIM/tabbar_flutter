import 'package:flutter/material.dart';

import 'animal.dart';

class FirstApp extends StatelessWidget {
  final List<Animal> list;
  FirstApp({Key? key, required this.list}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView.builder(itemBuilder: (context, position){ //position
            return Card(
              child: Text(list[position].name),
            );
          },  itemCount: list.length)
        ),
      ),
    );
  }
}