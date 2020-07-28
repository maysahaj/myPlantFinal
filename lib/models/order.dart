import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newFirebase_Project/models/products.dart';

class Order {
  List<Map<String, dynamic>> plants;
  String docId;
  String userId;
  String totalPrice;
  String status;

  String totalNumber;
  String date;

  Order(
      {this.plants,
      this.userId,
      this.totalPrice,
      this.totalNumber,
      this.status = 'processing',
      this.date});

  Order.fromJson(DocumentSnapshot documentSnapshot) {
    this.docId = documentSnapshot.documentID;
    this.userId = documentSnapshot.data['userId'];
    this.totalPrice = documentSnapshot.data['totalPrice'];
    this.totalNumber = documentSnapshot.data['totalNumber'];
    this.date = documentSnapshot.data['date'];
    this.status = documentSnapshot.data['status'];
//    this.drinks = documentSnapshot.data['drinks'];
    if (documentSnapshot.data['plants'] != null) {
      plants = List<Map<String, dynamic>>();
      documentSnapshot.data['plants'].forEach((v) {
        plants.add(Product.fromJson(v).toJson());
      });
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'drinks': this.plants,
      'userId': this.userId,
      'totalPrice': this.totalPrice,
      'totalNumber': this.totalNumber,
      'date': this.date,
      'status': this.status,
    };
  }
}
