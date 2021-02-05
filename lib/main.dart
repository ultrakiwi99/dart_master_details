import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_detail/pages/product_details_page.dart';
import 'package:master_detail/pages/product_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Master > Detail',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: ProductListPage.routeName,
      routes: {
        ProductListPage.routeName: (context) => ProductListPage(),
        ProductDetailsPage.routeName: (context) => ProductDetailsPage(),
      },
    );
  }
}
