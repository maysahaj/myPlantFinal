import 'package:newFirebase_Project/componants/models/product.dart';
import 'package:newFirebase_Project/features/customer/models/customer_products.dart';

class Order{
  List<DBProduct> products;
  List<Map> productMap;
  String userId;
  String address;
  String date;
 Order({this.products,this.userId,this.address,this.date,}){
   productMap = products.map((e) => e.toJson()).toList();
 }
 

  toJson(){
    return {'products':productMap,
    'userId':this.userId,
    'address;':this.address,
    'date':this.date
    };

  } 

}