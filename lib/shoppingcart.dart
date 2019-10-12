//购物车
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//商品,如果一个对象是不会改变的，你可以将这些对象创建为编译时常量。定义const构造函数，而且要确保所有的常量都是final的。
class Product{
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

//购物车的一条商品
class ShoppingListItem extends StatelessWidget{
  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
      : product = product,
        super(key: new ObjectKey(product));
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;
  Color _getContextColor(BuildContext context){
    return inCart ? Colors.black45 : Theme.of(context).primaryColor;
  }
  TextStyle _getContextTextStyle(BuildContext context){
        if(!inCart) return null; 
        return TextStyle(
          color: Colors.black54,
          decoration: TextDecoration.lineThrough
        );
  }
  Widget build(BuildContext context){
    return new ListTile(
      onTap: (){
        onCartChanged(this.product,this.inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getContextColor(context),
        child: new Text(product.name[0]),
      ),
      trailing: new CircleAvatar(
        backgroundColor: _getContextColor(context),
        child: new Text(product.name.toLowerCase()),
      ),
      title: new Text(product.name,style:_getContextTextStyle(context)),
    );
  }
}
class ShoppingList extends StatefulWidget{
  ShoppingList({Key key,this.products}) : super(key:key);
  final List<Product> products;
  @override
 _ShoppingListState createState() => new _ShoppingListState();
}
class _ShoppingListState extends State<ShoppingList>{
  Set <Product> _shoppingCart = new Set<Product>();
  _handleCartTaped(Product product,bool inCart){
    setState((){
      if(inCart){
        _shoppingCart.remove(product);
      }else{
        _shoppingCart.add(product);
      }
    });
  }
  Widget build(BuildContext context){
    return new Container(
      child: new ListView(
        padding: EdgeInsets.all(8),
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartTaped,
          );
        }).toList(),
      ),
    );
  }
}

class ShoppingCart extends StatelessWidget{
   Widget build(BuildContext context){
     return new Scaffold(
       appBar: new AppBar(title: new Text('购物车'),),
       body: new ShoppingList(
         products: <Product>
         [ 
           new Product(name:'衣服'),
           new Product(name:'电器'),
           new Product(name:'家具'),
         ],
       ),
     );
   }
}