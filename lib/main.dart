import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:tabbar_exmple/sub/firstPage.dart';
import 'package:tabbar_exmple/sub/secondPage.dart';

import 'sub/animal.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

 //with는 여러 클래스를 재사용할 수 있는 편리한 키워드
 //SingleTickerProviderStateMixin 클래스는 애니메이션을 처리하기 위한 헬퍼 클래스, 상속하지 않으면 탭바 컨트롤러를 생성할 수 없다.
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController controller;
  List<Animal> animal = [];
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this); //length : 탭 갯수, vsync 탭 이동했을 때 호출되는 콜백 함수를 어디서 처리할지 정함.
    animal = [Animal(name :'벌'), Animal(name :'새', flyExist : true), Animal(name : '강아지')];
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('TabBar Example'),
          ),
          body : TabBarView(
            children: <Widget>[FirstApp(list : animal), SecondApp(list : animal)],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(tabs: <Tab>[
        Tab(icon: Icon(Icons.looks_one, color: Colors.blue),),
        Tab(icon: Icon(Icons.looks_two, color: Colors.blue),)
      ], controller: controller,),
    );
  }
  
  // 위젯 트리에서 제거되기 전에 멤버로 갖고있는 controller부터 제거
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  
}
