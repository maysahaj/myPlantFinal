import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:newFirebase_Project/componants/models/Order.dart';
import 'package:newFirebase_Project/componants/models/product.dart';

import '../../../constants.dart';

class FsClient{
  FsClient._();
  static final FsClient adminClient = FsClient._();
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  Firestore firestore = Firestore.instance;

  Future<String> addNewOrder(Order order) async{
    try{
    DocumentReference documentReference = await  firestore.collection(ordersCollectionName).
    add(order.toJson());
    return documentReference.documentID;
    }catch (error) {
      print(error);
    }


  }
  Future<List<DocumentSnapshot>> getAllOrders() async{
    try{
      QuerySnapshot querySnapshot = await firestore.collection(ordersCollectionName).getDocuments();
      return querySnapshot.documents;
    }catch(error){
      print(error);
    }
  }
 
}
