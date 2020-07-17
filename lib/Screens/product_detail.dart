import 'package:flutter/material.dart';
import 'package:sqlite_demo/Data/dbhelper.dart';
import 'package:sqlite_demo/Models/Product.dart';

class ProductDetail extends StatefulWidget{
Product product;


  ProductDetail(Product product){
    this.product = product;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductDetailState(this.product);
  }


}
enum Options{delete,update}
class _ProductDetailState extends State {
  Product product;
  _ProductDetailState(this.product);
var dbHelper = DbHelper();

  var txtName =TextEditingController();
  var txtDescription =TextEditingController();
  var txtUnitPrice =TextEditingController();

  @override
  void initState() {
  txtName.text = product.name;
  txtDescription.text = product.description;
  txtUnitPrice.text = product.unitPrice.toString();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Detay Sayfası:${product.name}"),
        actions: <Widget>[
          PopupMenuButton<Options>(
            onSelected: selectProcess,
    itemBuilder: (BuildContext context)=><PopupMenuEntry<Options>>[
      PopupMenuItem<Options>(
        value: Options.delete,
        child: Text("Sil"),
      ),
      PopupMenuItem<Options>(
        value: Options.delete,
        child: Text("Güncelle"),
      )
    ],
          )
        ],
      ),
      body: buildProductDetail(),
    );
  }

 Widget buildProductDetail() {
return Padding(
  padding: EdgeInsets.all(30.0),
  child: Column(
    children: <Widget>[
      buildNameField(),
      buildDescriptionField(),

      buildUnitPriceField(),


    ],
  ),
);
  }
  buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Adı:"),
      controller: txtName,
    );
  }

  buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Açıklaması:"),
      controller: txtDescription,
    );
  }

  buildUnitPriceField() {
    return TextField(
      decoration: InputDecoration(labelText: "Birim Fiyatı:"),
      controller: txtUnitPrice,
    );
  }




  void selectProcess(Options options)async {
    switch(options){
      case Options.delete:
        await dbHelper.delete(product.id);
        Navigator.pop(context,true);
        break;

    case Options.update:
    await dbHelper.update(Product.withId(id:product.id,description:txtDescription.text,unitPrice:double.tryParse(txtUnitPrice.text),name:txtName.text));
    Navigator.pop(context,true);
    break;




    }
  }
}