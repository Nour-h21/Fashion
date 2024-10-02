class DressModel {
  String name;
  String size;
  String color;
  String price;
  String image;
  DressModel({
    required this.name,
    required this.size,
    required this.color,
    required this.price,
    required this.image,
  });

  static fromMap(Map<String, dynamic> map) {
    return DressModel(
      name: map['name'],
      size: map['size'],
      color: map['color'],
      price: map['price'],
      image: map['image'],
    );
  }

  toMap() {
    return {
      "name": name,
      "size": size,
      "price": price,
      "color": color,
      "image": image
    };
  }
}
