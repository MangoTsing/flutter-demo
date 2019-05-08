import 'package:flutter/material.dart';
import '../global_config.dart';
import '../api.dart';
import 'YuleListType.dart';
import '../home/question_page.dart';

class YuleList extends StatefulWidget{

  @override
  YuleListState createState() => new YuleListState();
}

class YuleListState extends State<YuleList> with AutomaticKeepAliveClientMixin{
  var ReadList = [];
  @override
  void initState(){
    super.initState();
    fetchData();
  }

  Widget YuleListCard(YuleListType city) {
    return new Container(
      decoration: new BoxDecoration(
          color: GlobalConfig.cardBackgroundColor,
          border: new BorderDirectional(
              bottom: new BorderSide(color: GlobalConfig.dark == true ?  Colors.white12 : Colors.black12, width: 1.0)
          )
      ),
      child: new FlatButton(
          onPressed: (){
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) {
                  return new QuestionPage(city: city.title,title: city.date,);
                }
            ));
          },
          child: new Container(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                    flex: 6,
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          child: new Text(
                            city.title,
                            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, height: 1.1, color: GlobalConfig.dark == true ? Colors.white70 : Colors.black),
                          ),
                          padding: const EdgeInsets.only(bottom: 10.0,right: 4.0),
                          alignment: Alignment.topLeft,
                        ),
                        city.title != null ?
                        new Container(
                            child: new Text('关键词：${city.category}', style: new TextStyle(color: GlobalConfig.fontColor)),
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(bottom: 3.0,right: 4.0)
                        ) : new Container(),
                        new Container(
                          child: new Text('发布时间：${city.date}', style: new TextStyle(color: GlobalConfig.fontColor)),
                          alignment: Alignment.topLeft,
                        )
                      ],
                    )
                ),
                new Expanded(
                    flex: 3,
                    child: new AspectRatio(
                        aspectRatio: 3.0 / 2.0,
                        child: new Container(
                          foregroundDecoration:new BoxDecoration(
                              image: new DecorationImage(
                                image: new NetworkImage(city.thumbnail_pic_s),
                                centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                              ),
                              borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                          ),
                        )
                    )
                )
              ],
            ),
          )
      ),
    );
  }


  List<Widget> _buildList(){
    return ReadList.map((city)=>YuleListCard(city)).toList();
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.only(top: 5.0),
        child:RefreshIndicator(
          onRefresh: fetchData,
          child: ListView(
            children: _buildList(),
          ),
        )
    );
  }

  Future<YuleListType> fetchData() async {
    yuleApi client = new yuleApi();
    Map data = await client.getYuleList("1ce351518ab3626ddad7466b92eb0917","yule");
    List list = data['data'].map((model) {
      return new YuleListType.fromJson(model);
    }).toList();
    setState(() {
      ReadList = list;
    });
  }
  @protected bool get wantKeepAlive=>true;
}