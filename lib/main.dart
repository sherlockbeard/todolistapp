import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: enter(),
      ),
    );
  }
}

class enter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _enter();
  }
}

class _enter extends State<enter> {
  String value = "";
  List<String> fo = ['fa', 'faa', 'asfasf'];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () {},
          child: Text('data'),
        ),
        TextField(),
        ListView.builder(
          itemCount: fo.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(fo[index]);
          },
        )
      ],
    );
  }
}
