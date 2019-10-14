
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';


typedef ClickCopyButton(BuildContext context);

class CopyUrlWidget extends StatelessWidget{
  CopyUrlWidget({Key key,this.context,this.clickCall}) : super(key:key);
  final BuildContext context;
  final ClickCopyButton clickCall; 
  Widget build(BuildContext context){
    return new Container(
      child: new FlatButton(      
        textTheme: ButtonTextTheme.primary,
        shape: null,
        child: new Text('复制Url',style: TextStyle(color: Colors.white),),
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

  void initState() {
    super.initState();

  }

  _copyBtnClick(BuildContext context){
    ClipboardData data = ClipboardData(text: widget.url);
    Clipboard.setData(data);
    showDialog(
      context:context,
      builder: (context){
        return new AlertDialog(
        title: Text('Alert提示框'),
        content: Text('复制成功'),
        actions: <Widget>[
          RaisedButton(
            child: Text('好的',style: TextStyle(color: Colors.white),),
            onPressed: (){
              Navigator.of(context).pop();  
            },
          ),
        ],
        );
      },
    );
    // Navigator.push(context, new MaterialPageRoute(fullscreenDialog: true, builder: (context) => new DialogWidget()));
  }
  //flutter_webview_plugin插件的webview并不存在于widget树中，所以不能在webview中使用如snackbars, dialogs ...
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text(widget.title),actions: <Widget>[CopyUrlWidget(context: context,clickCall: _copyBtnClick)],),
      body: new WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
           onWebViewCreated: (WebViewController web) {
              // webview 创建调用，
            web.loadUrl(widget.url); //此时也可以初始化一个url
            web.canGoBack().then((res){
                print(res); // 是否能返回上一级
             });
             web.currentUrl().then((url){
               print(url);// 返回当前url
             });
             web.canGoForward().then((res){
               print(res); //是否能前进
             });
            },
            onPageFinished: (String value) {
              // webview 页面加载调用
              print('加载结束'+value);
            },
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