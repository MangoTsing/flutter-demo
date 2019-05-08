import 'package:flutter/material.dart';
import 'index/index.dart';

void main() => runApp(new News());

class News extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "新闻APP",
      home: new Index(),
    );
  }

}
