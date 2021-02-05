import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_detail/models/product_detail_args.dart';
import 'package:master_detail/models/product_model.dart';
import 'package:master_detail/pages/product_details_page.dart';
import 'package:master_detail/services/product_service.dart';
import 'package:master_detail/widgets/error_message.dart';
import 'package:master_detail/widgets/loading.dart';
import 'package:master_detail/widgets/products_list.dart';

class ProductListPage extends StatelessWidget {
  static const routeName = "/products";
  final ProductService _productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Master Page"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Direct Navigation"),
        onPressed: () => Navigator.of(context).pushNamed(
          ProductDetailsPage.routeName,
          arguments: ProductDetailArgs(
            Right(2),
          ),
        ),
      ),
      body: FutureBuilder(
          future: _productService.getProducts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
            if (snapshot.hasError) {
              return ErrorMessage(snapshot.error);
            }

            if (snapshot.hasData) {
              return ProductsList(
                productList: snapshot.data,
                onTap: (Product product) => Navigator.of(context)
                    .pushNamed(ProductDetailsPage.routeName,
                        arguments: ProductDetailArgs(
                          Left(product),
                        )),
              );
            }

            return Loading();
          }),
    );
  }
}
