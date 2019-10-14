
import 'package:flutter/material.dart';


class DialogWidget extends StatelessWidget{
  Widget build(BuildContext context){
    return new Container(
        child: new AlertDialog(
              title: Text('复制成功'),
              content: new Text('复制成功'),
              actions: <Widget>[
                new FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: new Text('确定'),
                ),
              ],
            ),
      );
  }
}
