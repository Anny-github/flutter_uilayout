//Widgets目录
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uilayout/webviewwidgets.dart'; //

typedef void TapListTile(String name,BuildContext context);

class CatalogItem extends StatelessWidget{
  CatalogItem({Key key,this.name,this.tapListAction,this.context}) : super(key:key);
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


class WidgetCatalogView extends StatelessWidget{
  final List<String> listTitles = ['Accessibility：Semantics','Flutter中的动画'];
  _handleTapList(String name,BuildContext context){
    if (Comparable.compare(name, 'Accessibility：Semantics') == 0){
      Navigator.push(context, new MaterialPageRoute(builder: (context) => WebView(url: 'https://www.jianshu.com/p/8e547f5a12ce',title: name)));
    }else  if (Comparable.compare(name, 'Flutter中的动画') == 0){
      Navigator.push(context, new MaterialPageRoute(builder: (context) => WebView(url: 'https://www.jianshu.com/p/bc9fbfab70df',title: name)));
    }
    // CupertinoActionSheet(title: Text(name));
  }
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: Text('Widget 目录')),
      body: new ListView(
        children: listTitles.map((String name){
           return new CatalogItem(name:name,tapListAction: _handleTapList,context: context);
        }).toList(),
      ),
    );
  }
}