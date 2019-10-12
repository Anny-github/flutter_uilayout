import 'package:flutter/material.dart';
//StatefulWidget 自己管理state， 通过createState创建实例
//子state，进行state变量的定义和build

class StateTestPage extends StatelessWidget{
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text('state状态')),
      body: 
      new Column(
        children: <Widget>[
                TapA(),
                ParentState(),
        ],
      ),

    );
  }
}

//BoxA 
class TapA  extends StatefulWidget {
   //可选命名参数，构造函数
  TapA({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _TapAState createState() => _TapAState();
}

class _TapAState extends State<TapA>{
  bool _favorite = true;
  int _favoriteCount = 40;

  void handleTaped(){
    setState(() {
      _favoriteCount += _favorite?1:-1;
      _favorite = !_favorite;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          child: new IconButton(
            icon: Icon(
              _favorite?Icons.star:Icons.star_border
            ),
            color: Colors.red[500],
            onPressed: handleTaped,
          ),
        ),
        new SizedBox(
          width: 18,
          child: new Text("$_favoriteCount"),
        ),
      ],

    );
  } 
}


//BoxB  父widget管理favorite状态， 子widget交互修改父widget的变量，把事件和状态参数回调
class ParentState extends StatefulWidget{
  // ParentState({Key key, this.title}) : super(key: key);
  @override
  _TapBState createState() => _TapBState();
}

class _TapBState extends State <ParentState>{
  bool _favorite = false;
  void _handleValueChanged(bool newValue){
    setState(() {
      _favorite = newValue;
    });
  }
  Widget build(BuildContext context){
    return new Container(
      child: TapB(
        favorite: _favorite,
        onChanged: _handleValueChanged,
      ),
    );
  }
}

class TapB extends StatelessWidget{
   TapB({Key key, this.favorite: false, @required this.onChanged})
      : super(key: key);
   final bool favorite;
   final ValueChanged<bool> onChanged;
   void _handleTap(){
     onChanged(!favorite);
   }
   Widget build(BuildContext context){
     return new GestureDetector(
       onTap: _handleTap,
       child: new Container(
        child: new Center(
          child: new Text(
            favorite?"favorite":"unFavofite",style: new TextStyle(color: Colors.white)
          ),
        ),
        width: 200,
        height: 200,
        decoration : new BoxDecoration(
          color: favorite ? Colors.lightGreen[700] : Colors.grey[600],
        ),
       ), 
     );  
   }
}

// 混合管理 父widget负责背景色   子widget负责边框高亮
class ParentMultiWidget extends StatefulWidget{
  
  @override
  _ParentMultiState createState() => _ParentMultiState();
}
class _ParentMultiState extends State <ParentMultiWidget>{
   bool favorite = false;

   void _handleValueChanged(bool newValue){
     setState(() {
       favorite = newValue;
     });
   }
   Widget build(BuildContext context){
     return new Container(
      child: new Center(
         child: ChildMultiWidget(
           favorite:favorite,
           onChanged: _handleValueChanged,
         ),
       ),
     );
   }
 }

 class ChildMultiWidget extends StatefulWidget{
   ChildMultiWidget({Key key,this.favorite: false,@required this.onChanged}) : super(key:key);
   bool favorite;
   final ValueChanged<bool> onChanged;
   @override
   _ChildMultiState createState() => _ChildMultiState();
 }
 class _ChildMultiState extends State<ChildMultiWidget>{
    bool hilight = false;
    void _handleUp(TapUpDetails detail){
      setState(() {
        hilight = !hilight;
      });
    }
    void _handleDown(TapDownDetails detail){
      setState(() {
        hilight = !hilight;
      });
    }
    void _handleHilight(){
      setState(() {
        hilight = !hilight;
      });
    }
    void _handleTap(){
      widget.onChanged(widget.favorite);
    }
    Widget build(BuildContext context){
      return new Container(
        child: new GestureDetector(
          onTapUp: _handleUp,
          onTapDown: _handleDown,
          onTapCancel: _handleHilight,
          onTap: _handleHilight,
          child:  new Container(
            child: new Center(
              child:  new Text(
               widget.favorite?"favorite":"unFavorite",style: new TextStyle(color: Colors.red),
              ),             
            ),
            width: 100,
            height: 100,
            decoration: new BoxDecoration(
              color: widget.favorite?Colors.white:Colors.black,
              border: hilight?new Border.all(color: Colors.yellow):null
            ),
          ),

        ),
      );
    }
 }