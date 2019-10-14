
//flutter_webview_plugin如何使用网址：https://blog.csdn.net/hiyao_557/article/details/89509048
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_uilayout/commondialog.dart';
import 'package:flutter_uilayout/shoppingcart.dart';


typedef ClickCopyButton(BuildContext context);

class CopyUrlWidget extends StatelessWidget{
  CopyUrlWidget({Key key,this.context,this.clickCall}) : super(key:key);
  final BuildContext context;
  final ClickCopyButton clickCall; 
  Widget build(BuildContext context){
    return new Container(
      child: new RaisedButton(
        color: Colors.white.withAlpha(0),
        textTheme: ButtonTextTheme.normal,
        child: new Text('复制Url'),
        onPressed: (){
          this.clickCall(this.context);
        },
      ),
    );
  }
}


class WebViewPage extends StatefulWidget {
  WebViewPage({Key key, @required this.url, this.title})
      : super(key: key);
  final String url;
  final String title;
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebViewPage> {
  // WebView flutterWebviewPlugin = WebView();

  // void initState() {
  //   super.initState();
    // flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
    //   switch (state.type) {
    //     case WebViewState.shouldStart:
    //       //准备加载
    //       break;
    //     case WebViewState.startLoad:
    //       //开始加载
    //       break;
    //     case WebViewState.finishLoad:
    //       //加载完成
    //       break;
    //     case WebViewState.abortLoad:
    //       break;
    //   }
    // });
  // }

  _copyBtnClick(BuildContext context){
    ClipboardData data = ClipboardData(text: widget.url);
    Clipboard.setData(data);
    Navigator.push(context, new MaterialPageRoute(fullscreenDialog: true, builder: (context) => new ShoppingCart()));
  }
  //webview并不存在于widget树中，所以你不能在webview中使用如snackbars, dialogs ...这些通知交互widget，更详细一些使用方法可以点击这里；
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text(widget.title),actions: <Widget>[CopyUrlWidget(context: context,clickCall: _copyBtnClick)],),
      body: new WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          ),  
    );
  }

  @override 
  void dispose() {
    
    print('webview dispose');
    super.dispose();
  }
}



      // floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      // floatingActionButton: new  Builder(builder: (BuildContext context){
      //   return new FloatingActionButton(
      //     child:Text('复制URL'),
      //     tooltip: "Hello",
      //     foregroundColor: Colors.white,
      //     backgroundColor: Colors.black,
      //     heroTag: null,
      //     elevation: 7.0,
      //     highlightElevation: 14.0,
      //     mini: false,
      //     shape: new CircleBorder(),
      //     isExtended: false,
      //     onPressed: (){
      //       ClipboardData data = ClipboardData(text: widget.url);
      //       Clipboard.setData(data);
      //       setState(() {
      //         foot = new Container(
      //           child: new AlertDialog(
      //                 title: Text('复制成功'),
      //                 content: new Text('复制成功'),
      //                 actions: <Widget>[
      //                   new FlatButton(
      //                     onPressed: (){
      //                       Navigator.of(context).pop();
      //                     },
      //                     child: new Text('确定'),
      //                   ),
      //                 ],
      //               ),
      //         );
      //       });
      //     },          
      //   );
      // },),