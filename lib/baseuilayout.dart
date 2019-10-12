import 'package:flutter/material.dart';

class UILayoutPage extends StatelessWidget {
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('firstPage',style:new TextStyle(fontSize:20)),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          UILayoutContainer().cakeMakeUI,
          UILayoutContainer().fourImagesUI,
        ],
      ),
    );
  }
  
}

/* 基本布局  */ 
//layout container 
class UILayoutContainer extends Container{
  var cakeMakeUI;
  var fourImagesUI;
  //构造方法
  UILayoutContainer(){
      //定义一个通用的文本样式
      var textStyle = new TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.5,
        // height: 2.0,
      );

      //评级星星 + 文本
      var starUI = new Container(
        padding: new EdgeInsets.all(20.0),
        height: 60,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, //等间距
          children:[
            new Row(
              mainAxisSize: MainAxisSize.min,  //集中布局
              children:[
                new Icon(Icons.star,color:Colors.black),
                new Icon(Icons.star,color:Colors.black87),
                new Icon(Icons.star,color:Colors.black54),
                new Icon(Icons.star,color:Colors.black45),
                new Icon(Icons.star,color:Colors.black38),
              ],
            ),
            new Text(
              '星级评分',
              style: new TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w800),
              textDirection:TextDirection.ltr,
            ),
          ],
        ),
      );
      var titleText = new Container(
        child: new Text('蛋糕制作方法',style: textStyle),
      );
      var subTitle = new Container(
        child: new Text('制作方法具体制作方法具体制作方法',style: textStyle),
      );

      //三行 三列
      var threeRowAndColumn = new Container(
          padding: EdgeInsets.all(0),
          height: 117,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Column(
                // crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  new Icon(Icons.school, color:Colors.yellow),
                  new Text('第一列第2行'),
                  new Text('第一列第3行'),
                ],
              ),
              new Column(
                // crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  new Icon(Icons.kitchen, color:Colors.yellow),
                  new Text('第二列第2行'),
                  new Text('第二列第3行'),
                ],
              ),
              new Column(
                // crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  new Icon(Icons.home, color:Colors.yellow),
                  new Text('第三列第2行'),
                  new Text('第三列第3行'),
                ],
              ),
            ],
          ),
      );
    
      var leftColumn = new Container(
        padding: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        height: 227,
        child: new Column(
          children: [
            titleText,
            subTitle,
            starUI,
            threeRowAndColumn,
          ],
        ),
      );

      var rightImage = new Container(
        padding: new EdgeInsets.all(10),
        child: new Image.asset(
          'images/lake.jpg',
          width:300,
          height:100
        )
      );
      // 蛋糕UI
      cakeMakeUI =  new Container(
        margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        height: 337.0,
        child: new Card(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              rightImage,
              new Container(
                child: leftColumn,
              ),             
            ],
          ),
        ),  
      ); 
      // 拼图UI   expaned 能自适应填充，flex是拉伸系数，默认1
      fourImagesUI = new Container( //container 可设置pading margin   border
        width: 300,
        height: 300,
        padding: new EdgeInsets.all(10.0),
        decoration: new BoxDecoration(color: Colors.black26),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new Expanded(
                  child: new Container(
                    decoration: new BoxDecoration(
                      border: new Border.all(width: 5.0, color: Colors.black38),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(8.0)),
                    ),
                    margin: const EdgeInsets.all(4.0),
                    child: new Image.asset('images/pic1.jpg'),
                  ),
                ),
                new Expanded(
                  child: new Container(
                    decoration:new BoxDecoration(
                      border: Border.all(width: 5,color: Colors.black38),
                      borderRadius:  BorderRadius.all(const Radius.circular(8.0)),
                    ),
                    margin: EdgeInsets.all(4),
                    child: new Image.asset('images/pic2.jpg'),
                  ),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new Expanded(
                  child: new Container(
                    decoration:new BoxDecoration(
                      border: Border.all(width: 5,color: Colors.black38),
                      borderRadius:  BorderRadius.all(const Radius.circular(8.0)),
                    ),
                    margin: EdgeInsets.all(4),
                    child: new Image.asset('images/pic3.jpg'),
                  ),
                ),
                new Expanded(
                  child: new Container(
                    decoration:new BoxDecoration(
                      border: Border.all(width: 10,color: Colors.black38),
                      borderRadius:  BorderRadius.all(const Radius.circular(8.0)),
                    ),
                    margin: EdgeInsets.all(10),
                    child: new Image.asset('images/pic4.jpg'),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}
