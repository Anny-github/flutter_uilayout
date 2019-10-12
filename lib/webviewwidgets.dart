
//flutter_webview_plugin如何使用网址：https://blog.csdn.net/hiyao_557/article/details/89509048
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';



class CopyUrlWidget extends StatelessWidget{
  CopyUrlWidget({Key key,this.url,this.context}) : super(key:key);
  final String url;
  final BuildContext context; 
  Widget build(BuildContext context){
    return new Container(
      child: new RaisedButton(
        color: Colors.white.withAlpha(0),
        textTheme: ButtonTextTheme.normal,
        child: new Text('复制Url'),
        onPressed: (){
          ClipboardData data = ClipboardData(text: this.url);
          Clipboard.setData(data);
          showDialog<Null>(
            context: this.context, //在视图的context上下文弹窗
            builder: (BuildContext context){
              return new AlertDialog(
                title: Text('复制成功'),
                content: new Text('复制成功'),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: (){
                      Navigator.of(this.context).pop();
                    },
                    child: new Text('确定'),
                  ),
                ],
              );
            }
          );
        }),
    );
  }
}

class WebView extends StatefulWidget {
  WebView({Key key, @required this.url, this.title})
      : super(key: key);
  final String url;
  final String title;
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();


  void initState() {
    super.initState();
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      switch (state.type) {
        case WebViewState.shouldStart:
          //准备加载
          break;
        case WebViewState.startLoad:
          //开始加载
          break;
        case WebViewState.finishLoad:
          //加载完成
          break;
        case WebViewState.abortLoad:
          break;
      }
    });
  }
 
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
      // appBar: AppBar(title: Text(widget.title),leading: Builder(
      //   builder: (BuildContext context) {
      //     return IconButton(
      //       icon: const Icon(Icons.menu),
      //       onPressed:(){
      //         ClipboardData data = ClipboardData(text: widget.url);
      //         Clipboard.setData(data);
      //         showDialog(
      //           context: context, //在视图的context上下文弹窗
      //           builder: (BuildContext context){
      //             return new AlertDialog(
      //               title: Text('复制成功'),
      //               content: new Text('复制成功'),
      //               actions: <Widget>[
      //                 new FlatButton(
      //                   onPressed: (){
      //                     Navigator.of(context).pop();
      //                   },
      //                   child: new Text('确定'),
      //                 ),
      //               ],
      //             );
      //           }
      //         ); 
      //       },
      //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //     );
      //   }),
      // ),
      appBar: AppBar(title: Text(widget.title) ,actions: <Widget>[CopyUrlWidget(url: widget.url,context: context,)],
      ),
      withZoom: true, //允许网页缩放
      withLocalStorage: true,
      withJavascript: true, //允许执行 js 代码
    );
  }

  @override 
  void dispose() {
    flutterWebviewPlugin.dispose();
    print('webview dispose');
    super.dispose();
  }
}