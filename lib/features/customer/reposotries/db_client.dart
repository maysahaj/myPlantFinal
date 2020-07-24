
import 'dart:io';
import 'package:newFirebase_Project/features/customer/models/customer_products.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../../constants.dart';

class DBClient {
  DBClient._();

  static final DBClient dbClient = DBClient._();

  Database database;

  Future<Database> initDatabase() async {
    if (database == null) {
      database = await connectToDatabase();
      return database;
    } else {
      return database;
    }
  }

  Future<Database> connectToDatabase() async {
    try{
         Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = join(appDocDir.path, 'tasksDb.db');
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''CREATE TABLE $tableName(
          $productIDColumn  INTEGER PRIMARY KEY AUTOINCREMENT,
          $productNameColumn TEXT NOT NULL,
          $productPriceColumn TEXT NOT NUL,
          $productImageColumn TEXT NOT NUL,
          $productCountColumn INTEGER NOT NUL,
          
        )''');
      },
    );
    return database;

    }catch(error){
      print(error);
    }
 
  }

  Future<int> addNewProductToDB(DBProduct product) async {
    try {
      database = await initDatabase();
      int rowIndex = await database.insert(tableName, product.toJson());
      return rowIndex;
    } catch (error) {
      throw 'database error $error';
    }
  }

    Future<int> deleteProductFromCart(String id) async {
    try {
      database = await initDatabase();
      int rowIndex = await database.delete(tableName,where:'$productIDColumn = ?',whereArgs: [id]);
      return rowIndex;
    } catch (error) {
      throw 'database error $error';
    }
  }
   Future<int> updateProduct(DBProduct product) async {
    try {
      database = await initDatabase();
      product.productCount++;
      int rowIndex = await database.update(tableName, product.toJson());
      return rowIndex;
    } catch (error) {
      throw 'database error $error';
    }
  }
  Future<List<Map<String, dynamic>>> getAllProductFromDB() async{
   try{
     database = await initDatabase();
    List<Map<String, dynamic>> list = await database.query(tableName);
    return list;
   }catch(error){
     print(error);
   }
  }
}