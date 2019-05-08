import 'package:flutter/material.dart';
import '../global_config.dart';
import 'everydayIOS.dart';
import 'everydayNews.dart';
import 'hot.dart';
import 'search_page.dart';
import 'ask_page.dart';
import 'SidebarPage.dart';
import '../my/my_page.dart';
import '../api.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();

}

class _HomePageState extends State<HomePage> {
  var searchTitle = '搜索一下';
  @override
  void initState(){
    super.initState();
    fetchData();
  }
  Widget barSearch() {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new FlatButton.icon(
                onPressed: (){
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) {
                      return new SearchPage();
                    }
                  ));
                },
                icon: new Icon(
                  Icons.search,
                  color: GlobalConfig.fontColor,
                  size: 16.0
                ),
                label: new Text(
                  searchTitle,
                  style: new TextStyle(color: GlobalConfig.fontColor),
                ),
              )
          ),
          new Container(
            decoration: new BoxDecoration(
                border: new BorderDirectional(
                    start: new BorderSide(color: GlobalConfig.fontColor, width: 1.0)
                )
            ),
            height: 14.0,
            width: 1.0,
          ),
        ],
      ),
      decoration: new BoxDecoration(
        borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
        color: GlobalConfig.searchBackgroundColor,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            title: barSearch(),
            bottom: new TabBar(
              labelColor: GlobalConfig.dark == true ? new Color(0xFF63FDD9) : Colors.blue,
              unselectedLabelColor: GlobalConfig.dark == true ? Colors.white : Colors.black,
              tabs: [
                new Tab(text: "热门散读"),
                new Tab(text: "每日iOS"),
                new Tab(text: "每日Android"),
              ],
            ),
          ),
          drawer: new Drawer(     //侧边栏按钮Drawer
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(   //Material内置控件
                accountName: new Text('上官衍鹏'), //用户名
                accountEmail: new Text('757271842@qq.com'),  //用户邮箱
                currentAccountPicture: new GestureDetector( //用户头像
                  onTap: () => print('current user'),
                  child: new CircleAvatar(    //圆形图标控件
                    backgroundImage: new NetworkImage('https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1196415058,247626703&fm=26&gp=0.jpg'),//图片调取自网络
                  ),
                ),
                otherAccountsPictures: <Widget>[    //粉丝头像
                  Text('fans:',style: TextStyle(color: Colors.black54,fontSize: 15,),textAlign: TextAlign.center,),
                  new GestureDetector(    //手势探测器，可以识别各种手势，这里只用到了onTap
                    onTap: () => print('other user'), //暂且先打印一下信息吧，以后再添加跳转页面的逻辑
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3548579519,994138563&fm=26&gp=0.jpg'),
                    ),
                  ),
                  new GestureDetector(
                    onTap: () => print('other user'),
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage('https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2317527358,2485951019&fm=26&gp=0.jpg'),
                    ),
                  ),
                ],
                decoration: new BoxDecoration(    //用一个BoxDecoration装饰器提供背景图片
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    // image: new NetworkImage('https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg')
                    //可以试试图片调取自本地。调用本地资源，需要到pubspec.yaml中配置文件路径
                    image: new ExactAssetImage('images/lake.jpg'),
                  ),
                ),
              ),
              new ListTile(   //第一个功能项
                  title: new Text('我的主页'),
                  trailing: new Icon(Icons.arrow_upward),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new SidebarPage('上官衍鹏的主页')));
                  }
              ),
              new ListTile(   //第二个功能项
                  title: new Text('记录'),
                  trailing: new Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MyPage()));
                  }
              ),
              new Divider(),    //分割线控件
              new ListTile(   //退出按钮
                title: new Text('Close'),
                trailing: new Icon(Icons.cancel),
                onTap: () => Navigator.of(context).pop(),   //点击后收起侧边栏
              ),
            ],
          ),
        ),
          body: new TabBarView(
              children: [
                new Hot(),
                new EverydayIOS(),
                new EverydayNews(),
              ]
          ),
        ),
    );
  }
  Future<Null> fetchData() async {
    oneWord client = new oneWord();
    var data = await client.getOneWord();
    setState(() {
      searchTitle = data['hitokoto'].toString();
    });
  }

}