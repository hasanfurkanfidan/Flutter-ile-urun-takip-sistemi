import 'package:flutter/material.dart';
import 'package:sqlite_demo/Data/dbhelper.dart';
import 'package:sqlite_demo/Models/Product.dart';

class ProductAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return ProductAddState();
  }

}

class ProductAddState extends State {
  var dbHelper= DbHelper();
  var txtName =TextEditingController();
  var txtDescription =TextEditingController();
  var txtUnitPrice =TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(title: Text("Yeni Ürün Ekle"),)
     ,
     body:Padding(
       padding: EdgeInsets.all(30.0),
       child: Column(
         children: <Widget>[
           buildNameField(),
           buildDescriptionField(),
           
           buildUnitPriceField(),
           buildSaveButton()
           
         ],
       ),
     ) ,
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

 Widget buildSaveButton() {
    return FlatButton(
      child: Text("Ekle"),
      onPressed: (){
        addProduct();
      },
    );
  }

  void addProduct() async {
  var result =await dbHelper.insert(Product(name:txtName.text,description:txtDescription.text,unitPrice:double.tryParse(txtUnitPrice.text)));


     Navigator.pop(context, true);

  }
  
}