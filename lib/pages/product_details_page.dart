import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_detail/models/product_detail_args.dart';
import 'package:master_detail/models/product_model.dart';
import 'package:master_detail/services/product_service.dart';
import 'package:master_detail/widgets/error_message.dart';
import 'package:master_detail/widgets/loading.dart';
import 'package:master_detail/widgets/product_details.dart';

extension ToProductService on int {
  Future<Product> toProduct() async {
    final ProductService _productService = ProductService();
    final productID = this;

    return _productService.getProductByID(productID);
  }
}

class ProductDetailsPage extends StatelessWidget {
  static const routeName = '/products/detail';

  const ProductDetailsPage();

  @override
  Widget build(BuildContext context) {
    final ProductDetailArgs args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Page"),
      ),
      body: args.selectedProductOrID.fold(_buildFromProduct, _buildFromInt),
    );
  }

  Widget _buildFromProduct(Product product) {
    return ProductDetail(
      product: product,
    );
  }

  Widget _buildFromInt(int productID) {
    return FutureBuilder(
      future: productID.toProduct(),
      builder: (BuildContext context, AsyncSnapshot<Product> snapshot) {
        if (snapshot.hasError) {
          return ErrorMessage(snapshot.error);
        }

        if (snapshot.hasData) {
          return ProductDetail(
            product: snapshot.data,
          );
        }

        return Loading();
      },
    );
  }
}
