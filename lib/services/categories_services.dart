
import 'package:store_app/helpar/apr.dart';
import 'package:store_app/models/product_model.dart';

class CategoriesServices{


  Future<List<ProductModel>> getCategoriesProducts({required String categoriesName}) async {

    List<dynamic> data = await Api().get(url: "https://fakestoreapi.com/products/category/$categoriesName");

      List<ProductModel> productList =[];
      for(int i =0 ; i< data.length; i++ ){
        productList.add(
            ProductModel.fromJson(data[i])

        );
      }
      return productList;

    }

}