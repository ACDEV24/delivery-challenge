class Product {

  final String image;
  final String headerImage;
  final String name;
  final String subName;
  final String description;
  final double price;
  bool liked;

  Product({
    this.image,
    this.headerImage,
    this.name,
    this.subName,
    this.description,
    this.price,
    this.liked = false
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    image: json['image'] == null ? null : json['image'],
    headerImage: json['headerImage'] == null ? null : json['headerImage'],
    name: json['name'] == null ? null : json['name'],
    subName: json['subName'] == null ? null : json['subName'],
    description: json['description'] == null ? null : json['description'],
    price: json['price'] == null ? null : json['price'].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'image': image == null ? null : image,
    'headerImage': headerImage == null ? null : headerImage,
    'name': name == null ? null : name,
    'subName': subName == null ? null : subName,
    'description': description == null ? null : description,
    'price': price == null ? null : price,
  };
}
