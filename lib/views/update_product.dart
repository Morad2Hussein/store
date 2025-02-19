import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/methods/methods.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({Key? key}) : super(key: key);
  static String id = "UpdateProductPage";

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? title, description, image, price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Update",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 100.0, bottom: 16, right: 16, left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                    onChanged: (data) {
                      title = data;
                    },
                    hinText: "Product Name"),
                CustomTextField(
                    onChanged: (data) {
                      description = data;
                    },
                    hinText: "description"),
                CustomTextField(
                    onChanged: (data) {
                      price = data;
                    },
                    type: TextInputType.number,
                    hinText: "Price"),
                CustomTextField(
                    onChanged: (data) {
                      image = data;
                    },
                    hinText: "image"),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                    onPressed: () async{
                      isLoading = true;
                      setState(() {});
                      try {
                        await updateProductMethod(product);
                        print("success");
                      } catch (e) {
                        showSnackBar(context, e.toString());
                        // TODO
                      }

                      setState(() {
                        isLoading = false;
                      });
                    },
                    text: "Update"),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Future<void> updateProductMethod(ProductModel product) async{
    await UpdateProduct().updateProduct(
      id: product.id,
      title: title == null ? product.title : title!,
      price: price == null ? product.price : price!,
      description: description == null ? product.description : description!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
  }
}
