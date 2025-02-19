
import 'package:store_app/helpar/apr.dart';

class GetAllCategories{
  Future<List<dynamic>>getAllCategories()async{


    List<dynamic> data = await Api().get(url: "https://fakestoreapi.com/products/categories");
    return data;
  }


}