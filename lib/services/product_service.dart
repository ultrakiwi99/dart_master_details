import 'dart:math';

import 'package:master_detail/constants/product.dart';
import 'package:master_detail/models/product_model.dart';

class NetworkException {
  final String message;

  NetworkException(this.message);
}

class ProductService {

  Future<List<Product>> getProducts() async {
    try {
      await _shouldError("Couldn't fetch products list");

      return kProductList;
    } on NetworkException catch (e) {
      return Future.error(e.message);
    }
  }

  Future<Product> getProductByID(int id) async {
    try {
      await _shouldError("Couldn't fetch product by ID");

      return kProductList.firstWhere(
              (element) => element.id == id,
        orElse: () => throw NetworkException("Couldn't fetch product by ID")
      );
    } on NetworkException catch(e) {
      return Future.error(e.message);
    }
  }


  Future<void> _shouldError(String errorMessage) async {
    final _random = Random();
    final error = _random.nextBool();

    return error
        ? Future.delayed(Duration(seconds: 1),
            () => Future.error(NetworkException(errorMessage)))
        : Future.delayed(Duration(seconds: 1), null);
  }
}
