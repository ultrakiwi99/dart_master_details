import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_detail/models/product_model.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 6,
      ),
      child: ListView(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              product.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(product.dateCreated),
          ),
          Text(product.description())
        ],
      ),
    );
  }
}
