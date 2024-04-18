class Model {
  int? id;
  String? name;
  String? description;
  String? price;
  String? images;
  String? color;
  String? brand;
  String? category;
  int? stockQuantity;
  String? ratings;

  Model(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.images,
      this.color,
      this.brand,
      this.category,
      this.stockQuantity,
      this.ratings});

  Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    images = json['images'];
    color = json['color'];
    brand = json['brand'];
    category = json['category'];
    stockQuantity = json['stock_quantity'];
    ratings = json['ratings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['images'] = this.images;
    data['color'] = this.color;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['stock_quantity'] = this.stockQuantity;
    data['ratings'] = this.ratings;
    return data;
  }
}
