import 'package:newFirebase_Project/componants/models/product.dart';

class Order{
  List<Product> products;
  toJson(){
    return {'products':products};
  } 

}