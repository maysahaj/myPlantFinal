import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:newFirebase_Project/componants/models/product.dart';

import '../../../constants.dart';

class AdminClient{
  AdminClient._();
  static final AdminClient adminClient = AdminClient._();
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  Firestore firestore = Firestore.instance;
    Future<String> uploadImage(File file) async {
    try {
      DateTime dateTime = DateTime.now();
      StorageTaskSnapshot snapshot = await firebaseStorage
          .ref()
          .child('products/$dateTime.jpg')
          .putFile(file)
          .onComplete;
      String imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (error) {
      print(error);
    }
  }
  Future<String> addNewProduct(Product product) async{
    try{
    DocumentReference documentReference = await  firestore.collection(productsCollectionName).add(product.toJson());
    return documentReference.documentID;
    }catch (error) {
      print(error);
    }


  }
  Future<List<DocumentSnapshot>> getAllProduct() async{
    try{
      QuerySnapshot querySnapshot = await firestore.collection(productsCollectionName).getDocuments();
      return querySnapshot.documents;
    }catch(error){
      print(error);
    }
  }
  Future<String> editProduct(Product product) async{
    try{
     firestore.collection(productsCollectionName).document(product.documentId).setData(product.toJson());
    }catch(error){
      print(error);
    }

  }
  Future<String> deleteProduct(String documentId) async{
     try{
     firestore.collection(productsCollectionName).document(documentId).delete();

    }catch(error){
      print(error);
    }

  }
   Future<List<DocumentSnapshot>> getAllProducts() async {
    try {
      QuerySnapshot querySnapshot =
          await firestore.collection(productsCollectionName).getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }
}
