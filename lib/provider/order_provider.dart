
import 'package:flutter/cupertino.dart';
import 'package:newFirebase_Project/models/order.dart';
import 'package:newFirebase_Project/repositories/db_repository.dart';
import 'package:newFirebase_Project/repositories/orderClient.dart';
import 'package:newFirebase_Project/repositories/orderRepositry.dart';

class OrderProvider extends ChangeNotifier {
  addNewOrder(Order order) async {
    await OrderRepository.orderRepository.addNewOrder(order);
    getAllOrder();
//    notifyListeners();
  }

  List<Map<String, dynamic>> allProductsMap = [];
  List<Order> allOrder = [];

  setAllProductsMap() async {
    this.allProductsMap = await DBRepository.dbRepository.getAllProductMap();
    getAllOrder();
    notifyListeners();
  }

  Future<List<Order>> getAllOrder() async {
    List<Order> allOrder = await OrderRepository.orderRepository.getAllOrder();
    notifyListeners();

    return allOrder;
  }
  Future<List<Order>> getAllOrderAdmin() async {
    List<Order> allOrder = await OrderRepository.orderRepository.getAllOrderAdmin();
    notifyListeners();

    return allOrder;
  }

  deleteOrder(String iD) async {
    await OrderClient.orderClient.deleteOrder(iD);
    getAllOrder();
  }

  updateField(Order order,String iD) async {
    await OrderRepository.orderRepository.updateFieldOrder(order,iD);
    getAllOrderAdmin();
notifyListeners();
  }

  deleteAllOrder() async {
    await OrderClient.orderClient.deleteAllOrder();
    getAllOrder();
//    notifyListeners();
  }
}