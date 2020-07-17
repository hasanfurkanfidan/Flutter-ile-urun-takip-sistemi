import 'package:flutter/material.dart';
import 'package:sqlite_demo/Screens/product_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(
     home: ProductList(),
   );
  }

}

