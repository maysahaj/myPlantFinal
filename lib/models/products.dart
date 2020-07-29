import 'package:newFirebase_Project/repositories/db_client.dart';

class Product {
  String image;
  String typePlant;
  int price;
  int numPlant;
  int size;
  int id;

  Product({
    this.image,
    this.typePlant,
    this.price,
    this.numPlant,
    this.size,
  });

  Product.fromJson(Map<String, dynamic> map) {
    this.id = map[DBClient.dbClient.productIdColumn];
    this.typePlant = map[DBClient.dbClient.typePlantColumn];
    this.price = map[DBClient.dbClient.priceColumn];
    this.numPlant = map[DBClient.dbClient.numPlantColumn];
    this.size = map[DBClient.dbClient.sizeColumn];
    this.image=map[DBClient.dbClient.imageColumn];

  }

  Map<String , dynamic> toJson() {
    return {
      DBClient.dbClient.typePlantColumn: this.typePlant,
      DBClient.dbClient.priceColumn: this.price,
      DBClient.dbClient.numPlantColumn: this.numPlant,
      DBClient.dbClient.sizeColumn: this.size,
      DBClient.dbClient.imageColumn: this.image,
    };
  }
}

final List<Product> products = [
  Product(
    image: 'assets/images/p3.png',
    typePlant: 'Gbit Plant',
    price: 20,
  ),

  Product(
    image: 'assets/images/maysa.png',
    typePlant: 'type1 Plant',
    price: 40,
  ),
  Product(
    image: 'assets/images/p2.png',
    typePlant: 'type2 Plant',
    price: 60,
  ),
];
