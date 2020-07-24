import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newFirebase_Project/componants/models/product.dart';
import 'package:newFirebase_Project/features/admin/reposotries/AdminClient.dart';
import 'package:newFirebase_Project/features/admin/reposotries/Admin_repository.dart';

class AdminProvider extends ChangeNotifier {
  List<Product> allProducts = [];
  String productName;
  String productDescription;
  double price;
  bool isAvailable;
  String imageUrl;
  
  setProductName(String value) {
    this.productName = value;
  }

  setProductDescription(String value) {
    this.productDescription = value;
  }
 setProductIsAvailable(bool value) {
    this.isAvailable = value;
  }
  setProductPrice(String value) {
      this.price = double.parse(value);
   }
  
  uploadImage(File file) async {
    String imageUrl = await AdminClient.adminClient.uploadImage(file);
    this.imageUrl=  imageUrl;
    notifyListeners();
  }

  Future<bool> addNewProduct() async {
    try {
      Product product = Product(
        imageUrl: this.imageUrl,
        isAvailable: this.isAvailable,
        description: this.productDescription,
        name: this.productName,
        price: this.price,
      );
      String productId = await AdminClient.adminClient.addNewProduct(product);
      
      if(productId != null){
        getAllProducts();
        return true;
      }else{
        return false;
      }
    } catch (error) {
      print(error);
    }
  }

  getAllProducts() async {
    List<Product> products = await AdminRepository.adminRepository.getAllProducts();
    this.allProducts = products;
    notifyListeners();
  }

  updateProduct(Product product) async {
    await AdminClient.adminClient.editProduct(product);
    getAllProducts();
  }

  deleteProduct(String documentId) async {
    await AdminClient.adminClient.deleteProduct(documentId);
    getAllProducts();
  }
}
