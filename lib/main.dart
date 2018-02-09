import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';


void main() {
  runApp(new MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        key: new Key('user-list'),
        children: <Widget>[
          _child(),
          new Container(
            height: 500.0,
            color: Colors.red,
          ),
          new Container(
            height: 500.0,
            color: Colors.green,
          ),
          new Container(
            height: 500.0,
            color: Colors.blue,
          ),
          new Container(
            height: 500.0,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }

  Widget _child() {
    return new Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: 5.0,
        bottom: 10.0,
      ),
      child: new Image.asset(
        "images/test.png",
      ),
    );
  }
}