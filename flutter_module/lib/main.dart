import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_module/correct_wrong_overlay.dart';

void main() => runApp(chooseWidget(window.defaultRouteName));

Widget chooseWidget(String route) {
  switch (route) {
    case "r1":
      return MyApp();
    default:
      return Center(
        child: Text("unkown route string"),
      );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            )
          ],
        ),
      ),
      floatingActionButton: Increment(_incrementCounter),
    );
  }
}

class Increment extends StatefulWidget {
  Function mIncrement;

  @override
  State createState() {
    return IncrementState();
  }

  Increment(Function incrementCounter) {
    this.mIncrement = incrementCounter;
  }
}

class IncrementState extends State<Increment> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: widget.mIncrement,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}
