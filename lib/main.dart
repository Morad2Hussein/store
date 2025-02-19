import 'package:flutter/material.dart';
import 'package:store_app/views/home_view.dart';
import 'package:store_app/views/update_product.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StoreApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        HomeView.id :(context)=>HomeView(),
        UpdateProductPage.id :(context)=>UpdateProductPage(),
      },
      initialRoute: HomeView.id,

    );
  }
}


