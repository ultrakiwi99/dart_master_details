
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:master_detail/models/product_model.dart';

@immutable
class ProductDetailArgs {
  final Either<Product, int> selectedProductOrID;

  const ProductDetailArgs(this.selectedProductOrID);
}
