

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newFirebase_Project/componants/models/product.dart';
import 'package:newFirebase_Project/features/admin/reposotries/AdminClient.dart';


class AdminRepository {
  AdminRepository._();
  static AdminRepository adminRepository = AdminRepository._();
  // addNewProduct(Product product, File imageFile) async {
  //   try {
  //     String url = await AdminClient.adminClient.uploadImage(imageFile);
  //     product.imageUrl = url;
  //     String id = await AdminClient.adminClient.uploadProduct(product);
  //   } catch (error) {
  //     print(error);
  //   }
  // }
/// snapshot to list of product
  Future<List<Product>> getAllProducts() async {
    try{
       List<DocumentSnapshot> documents =
        await AdminClient.adminClient.getAllProducts();
    List<Product> products =
        documents.map((e) => Product.fromDocumentSnapshot(e)).toList();
    return products;
    }
    catch(error){
      print(error);
    }
  }
}
