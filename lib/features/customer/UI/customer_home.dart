import 'dart:io';
import 'package:flutter/material.dart';
import 'package:newFirebase_Project/componants/models/product.dart';
import 'package:newFirebase_Project/features/customer/reposotries/customer_repository.dart';

class CustomerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      body:Center(child: RaisedButton(onPressed: (){
        CustomerRepository.customerRepository.getAllProductsInShoppingCart();
        
      }),)
        
        
        );
  }
}