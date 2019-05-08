import 'package:flutter/material.dart';
import 'reply_page.dart';
import '../global_config.dart';
import '../api.dart';
import 'NewsList.dart';

class EverydayNews extends StatefulWidget {

  @override
  EverydayNewsState createState() => new EverydayNewsState();

}

class EverydayNewsState extends State<EverydayNews> with AutomaticKeepAliveClientMixin{

  @override
  void initState() {
    super.initState();
    fetchData();
  }
  var newsList = [];
  var urlList = [];
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white70,
        padding: EdgeInsets.only(left: 10,right: 10),
        margin: EdgeInsets.only(top: 20),
        child:RefreshIndicator(
          onRefresh: fetchData,
          child: ListView(
            children: _buildList(),
          ),
        )
    );
  }
  List<Widget> _buildList(){
    return newsList.map((city)=>_item(city)).toList();
  }
  Widget _item(city){
    return Column(
      children: <Widget>[
        Container(
          height:80,
          margin: EdgeInsets.only(top: 5),
          padding: EdgeInsets.only(left: 20,right: 20,top: 0),
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.black12),
          child: Text('${city.desc}',style: TextStyle(color: Colors.black54,fontSize: 20),),
        ),
        Container(
          height:40,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.black12),
          child: Text('url：${city.url}',style: TextStyle(color: Colors.teal,fontSize: 15),),
        ),
        Container(
          height:30,
          margin: EdgeInsets.only(bottom: 5),
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.black12),
          child: Text('创建时间：${city.createdAt}',style: TextStyle(color: Colors.teal,fontSize: 15),),
        ),
      ],
    );
  }

  Future<NewsList> fetchData() async {
    ApiClient client = new ApiClient();
    Map data = await client.getTodayNews();
    List list = data['Android'].map((model) {
      return new NewsList.fromJson(model);
    }).toList();
//    for (NewsList model in list) {
//      _decodeResult =
//      '描述：${model.desc}\n地址：${model.url}\n时间：${DateTime.parse(
//          model.publishedAt)}';
//    }
    setState(() {
      newsList = list;
    });
  }
  @protected bool get wantKeepAlive=>true;

}