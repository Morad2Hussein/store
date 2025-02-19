/*
class ProductModel {
  final String id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rating: jsonData.fromJson(jsonData['rating']),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}


*/
class ProductModel {
  final int id; // تعريف id كـ int
  final String title;
  final String price; // تغيير price إلى double
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  /*factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData['id'], // API ترجع id كـ int
      title: jsonData['title'],
      price: (jsonData['price'] as num).toString(), // تحويل أي رقم إلى double
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rating: RatingModel.fromJson(jsonData['rating']), // تمرير rating بشكل صحيح
    );
  }*/
  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData['id'] ?? 0, // تأكد من تعيين قيمة افتراضية لـ id
      title: jsonData['title'] ?? "No Title",
      price: jsonData['price'] is num
          ? jsonData['price'].toString() // إذا كان رقمًا نحوله إلى String
          : jsonData['price']?.toString() ?? "0.0", // إذا كان نصًا أو null نحوله
      description: jsonData['description'] ?? "No Description",
      category: jsonData['category'] ?? "No Category",
      image: jsonData['image'] ?? "https://via.placeholder.com/150",
      rating: RatingModel.fromJson(jsonData['rating'] ?? {}), // معالجة null في rating
    );
  }

}

class RatingModel {
  final double rate; // تغيير rate إلى double
  final int count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(Map<String, dynamic> jsonData) {
    return RatingModel(
      rate: (jsonData['rate'] is num) ? jsonData['rate'].toDouble() : 0.0, // التحقق من النوع
      count: (jsonData['count'] is int) ? jsonData['count'] : 0, // تعيين قيمة افتراضية
    );
  }

  /*factory RatingModel.fromJson(Map<String, dynamic> jsonData) {
    return RatingModel(
      rate: (jsonData['rate'] as num).toDouble(), // تحويل rate إلى double
      count: jsonData['count'], // API ترجع count كـ int
    );
  }*/
}

