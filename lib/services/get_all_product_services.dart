import 'dart:convert';

import 'package:store_app/helpar/apr.dart';
import 'package:store_app/models/product_model.dart';


class GetAllProducts {
  Future<List<ProductModel>> getAllProducts() async {
   List<dynamic> data =
        await Api().get(url: "https://fakestoreapi.com/products");

    List<ProductModel> productList =[];
  for(int i =0 ; i< data.length; i++ ){
    productList.add(
      ProductModel.fromJson(data[i])

    );
  }
   return productList;

  }
}
