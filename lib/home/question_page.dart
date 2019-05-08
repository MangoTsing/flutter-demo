import 'package:flutter/material.dart';
import '../global_config.dart';
import 'reply_page.dart';
import '../global_config.dart';
import 'package:flutter_html/flutter_html.dart';
class QuestionPage extends StatefulWidget {
  String city;
  String title;
  QuestionPage({Key key, @required this.city, this.title}):super(key:key);

  @override
  QuestionPageState createState() => new QuestionPageState();

}

class QuestionPageState extends State<QuestionPage> with AutomaticKeepAliveClientMixin{
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: GlobalConfig.themeData,
      home: new Scaffold(
        appBar: new AppBar(
            title: Common.searchInput(context)
        ),
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
//              new Container(
//                child: new Row(
//                  children: <Widget>[
//                    new Container(
//                      child: new FlatButton(onPressed: (){}, child: new Text("物理学"), color: GlobalConfig.searchBackgroundColor),
//                      height: 30.0,
//                      margin: const EdgeInsets.only(right: 8.0)
//                    ),
//                    new Container(
//                      child: new FlatButton(onPressed: (){}, child: new Text("三体(书籍)"), color: GlobalConfig.searchBackgroundColor),
//                      height: 30.0,
//                        margin: const EdgeInsets.only(right: 8.0)
//                    ),
//                    new Container(
//                      child: new FlatButton(onPressed: (){}, child: new Text("脑洞(网络用语)"), color: GlobalConfig.searchBackgroundColor),
//                      height: 30.0,
//                    )
//                  ],
//                ),
//                padding: new EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0, right: 16.0),
//                color: GlobalConfig.cardBackgroundColor,
//              ),
              new Container(
                child: new Text(widget.title, style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0, height: 1.3, color: GlobalConfig.dark == true ? Colors.white70 : Colors.black),textAlign: TextAlign.center,),
                padding: new EdgeInsets.only(left: 20.0, bottom: 8.0, right: 16.0),
                margin: new EdgeInsets.only(top:10),
                alignment: Alignment.topLeft,
                color: GlobalConfig.cardBackgroundColor
              ),
              new Container(
                child: new Html(
                    data:widget.city,
                    padding: EdgeInsets.all(8.0),
                    backgroundColor: Colors.black26,
                    defaultTextStyle: TextStyle(fontFamily: 'serif',color: GlobalConfig.dark== true ?  Colors.white70 : Colors.white),
                    linkStyle: const TextStyle(
                      color: Colors.redAccent,
                    ),
                ),
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
                decoration: new BoxDecoration(
                  border: new BorderDirectional(bottom: new BorderSide(color: GlobalConfig.dark == true ?  Colors.white12 : Colors.black12)),
                  color: GlobalConfig.cardBackgroundColor
                ),
              ),
            ],
//            children: <Widget>[
//              new HtmlView(
//                data: widget.city,
//              )
//            ],
          ),
        )
      )
    );
  }
  @protected bool get wantKeepAlive=>true;

}