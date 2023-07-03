class SareeModel {
  final String id;
  final String title;
  final double price;
  final String description;
  final String imageURL;
  int likesCount;

  SareeModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.imageURL,
    this.likesCount = 0,
  });

  factory SareeModel.fromJson(Map<String, dynamic> json) {
    return SareeModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      imageURL: json['imageURL'],
      likesCount: json['likesCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'imageURL': imageURL,
      'likesCount': likesCount,
    };
  }
}
