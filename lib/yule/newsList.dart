import 'package:flutter/material.dart';
import '../global_config.dart';
import '../api.dart';
import 'NewsListType.dart';
import '../home/question_page.dart';

class NewsList extends StatefulWidget{

  @override
  NewsListState createState() => new NewsListState();
}

class NewsListState extends State<NewsList> with AutomaticKeepAliveClientMixin{
  var ReadList = [];
  var counts = 10;
  var pages = 1;
  @override
  void initState(){
    super.initState();
    fetchYuleData();
  }

  Widget NewsListCard(NewsListType city) {
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
                  return new QuestionPage(city: city.text,title: city.add_time,);
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
                            city.text,
                            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, height: 1.1, color: GlobalConfig.dark == true ? Colors.white70 : Colors.black),
                          ),
                          padding: const EdgeInsets.only(bottom: 10.0,right: 4.0),
                          alignment: Alignment.topLeft,
                        ),
                        city.text != null ?
                        new Container(
                            child: new Text('关键词：${city.keywords}', style: new TextStyle(color: GlobalConfig.fontColor)),
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(bottom: 3.0,right: 4.0)
                        ) : new Container(),
                        new Container(
                          child: new Text('发布时间：${city.add_time}', style: new TextStyle(color: GlobalConfig.fontColor)),
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
                                image: new NetworkImage(city.pic),
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
    return ReadList.map((city)=>NewsListCard(city)).toList();
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.only(top: 5.0),
        child:RefreshIndicator(
          onRefresh: fetchYuleData,
          child: ListView(
            children: _buildList(),
          ),
        )
    );
  }

  Future<NewsListType> fetchYuleData() async {
    Yule360Api client = new Yule360Api();
    Map data = await client.getYule360List(counts.toString(),pages.toString());
    List list = data['list'].map((model) {
      return new NewsListType.fromJson(model);
    }).toList();
    setState(() {
      pages = pages + 1;
      ReadList = list;
    });
  }
  @protected bool get wantKeepAlive=>true;
}