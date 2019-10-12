
import 'package:flutter/material.dart';
import 'package:flutter_uilayout/baseuilayout.dart';
import 'package:flutter_uilayout/statefulwidgettest.dart';
import 'package:flutter_uilayout/shoppingcart.dart';
import 'package:flutter_uilayout/widgetcatalogView.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //MaterialApp  自带appbar 背景白色
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeListPage(),
    );
  }
}

typedef void TapListTile(String name,BuildContext context);

class HomeListItem extends StatelessWidget{
  HomeListItem({Key key,this.name,this.tapListAction,this.context}) : super(key:key);
  final String name;
  final BuildContext context;
  final TapListTile tapListAction;
  Widget build(BuildContext context){
    return new ListTile(
    title: Text(this.name),
    onTap:(){
      this.tapListAction(this.name,this.context);
    },
  );
  }
}

class HomeListPage extends StatelessWidget{
  final List<String> listTitles = ['基本布局','多行多列','state状态','购物车','widget目录'];
  _handleTapList(String name,BuildContext context){
    // CupertinoActionSheet(title: Text(name));
    // Future.delayed(Duration(seconds: 2),(){  
      if (Comparable.compare(name, '基本布局') == 0){
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new UILayoutPage()));
      }else  if (Comparable.compare(name, '多行多列') == 0){
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new GridViewLayoutApp()));
      }else  if (Comparable.compare(name, 'state状态') == 0){
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new StateTestPage()));
      }else  if (Comparable.compare(name, '购物车') == 0){
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new ShoppingCart()));
      }else  if (Comparable.compare(name, 'widget目录') == 0){
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new WidgetCatalogView()));
      }
    // });
   
  }

  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: Text('Widget 目录')),
      body: new ListView(
        children: listTitles.map((String name){
           return new HomeListItem(name:name,tapListAction: _handleTapList,context: context);
        }).toList(),
      ),
    );
  }
}


Widget buildMutilColumnGridView(){
  // List<Container> _buildGridTileList(int count) {
  // // fq
  //   return new List<Container>.generate(
  //     count,
  //     (int index) =>
  //         new Container(child: new Image.asset('images/lake.jpg'))
  //   );
  // }
    
  final int num = 30;
  return new GridView.count(
    crossAxisCount: 3, //每行几列
    crossAxisSpacing: 10,  //行间距
    mainAxisSpacing: 10,
    padding: new EdgeInsets.all(10),
    children: List<Container>.generate(
      num,
      (int index) =>
        new Container(child: new Image.asset('images/lake.jpg'))
    ),
  );
}
/* GirdView  三列*/
class GridViewLayoutApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('gridView列表布局',style:new TextStyle(fontSize:20)),
      ),
      body: new Center(
        child:buildMutilColumnGridView(),
      ),
    );
  }
}

