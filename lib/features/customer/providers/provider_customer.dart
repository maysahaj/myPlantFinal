import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newFirebase_Project/componants/models/product.dart';
import 'package:newFirebase_Project/features/admin/reposotries/AdminClient.dart';
import 'package:newFirebase_Project/features/admin/reposotries/Admin_repository.dart';
import 'package:newFirebase_Project/features/customer/models/customer_products.dart';
import 'package:newFirebase_Project/features/customer/reposotries/customer_repository.dart';

class CustomerProvider extends ChangeNotifier {
  List<DBProduct> allDBProduct= [];

  getProductsfromDB() async {
    List<DBProduct> products = await CustomerRepository.customerRepository.getAllProductsInShoppingCart();
    allDBProduct = products;
    notifyListeners();
  }
   
  Future<bool> addNewProductToCart(DBProduct product) async {
    try {
      await CustomerRepository.customerRepository.addNewProduct(product);
      getProductsfromDB();
     
    } catch (error) {
      print(error);
    }
  }

 addOrderToFs() async{

  }



}
