import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newFirebase_Project/componants/models/Order.dart';
import 'package:newFirebase_Project/features/customer/models/customer_products.dart';
import 'package:newFirebase_Project/features/customer/reposotries/db_client.dart';
import 'package:newFirebase_Project/features/customer/reposotries/fs_client.dart';

class CustomerRepository{
  static final CustomerRepository customerRepository = CustomerRepository._();

  CustomerRepository._();

   addNewProduct(DBProduct product) async{
       try{
        int rowNum = await DBClient.dbClient.addNewProductToDB(product);
        return rowNum;
    }
    catch(error){
      print(error);
    }
  }
    
  addNewOrder(Order order) async{   
    try{
      String orderDocumentiD =await FsClient.adminClient.addNewOrder(order.toJson());
      print(orderDocumentiD);
    }
    catch(error){
      print(error);
    }
  }

  Future<List<DBProduct>> getAllProductsInShoppingCart() async{
  try{
    List<Map<String, dynamic>> products = 
    await DBClient.dbClient.getAllProductFromDB();
    List<DBProduct> productsList = products.map((e) => DBProduct.fromMap(e)).toList() ; 
     return productsList;
    }
    catch(error){
      print(error);
    }
  }
  

  Future<List<Order>> getAllOrderFromFirestore() async{
  try{
     List<DocumentSnapshot> documents = await FsClient.adminClient.getAllOrders();
    }
    catch(error){
      print(error);
    }
  
  }
  increaseProductCountInShoppingCart(DBProduct product) async{
    
  try{
    DBClient.dbClient.updateProduct(product);  
    }
    catch(error){
      print(error);
    }
  
  }
  deleteProductInShoppingCart(String productId) async{
    try{
      DBClient.dbClient.deleteProductFromCart(productId);
    }
    catch(error){
      print(error);
    }
  
  }
}