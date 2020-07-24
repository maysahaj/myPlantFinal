import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newFirebase_Project/componants/models/product.dart';
import 'package:newFirebase_Project/features/admin/UI/admin_product_item.dart';
import 'package:newFirebase_Project/features/admin/UI/customTextField.dart';
import 'package:newFirebase_Project/features/admin/providers/adminProvider.dart';
import 'package:provider/provider.dart';

class AdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('AdminHome'),
            bottom: TabBar(tabs: [
              Tab(
                text: 'New Product',
              ),
              Tab(
                text: 'All Products',
              )
            ]),
          ),
          body: TabBarView(children: [AddNewProduct(), AllProducts()]),
        ));
  }
}

enum textFieldType { name, description, price }

class AddNewProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        GestureDetector(onTap: () async {
          try {
            PickedFile pickedFile = await ImagePicker().getImage(
                source: ImageSource.camera, maxHeight: 150, maxWidth: 150);
            File file = File(pickedFile.path);
            Provider.of<AdminProvider>(context, listen: false)
                .uploadImage(file);
          } catch (error) {
            print(error);
          }
        }, child: Consumer<AdminProvider>(
          builder: (context, value, child) {
            String image = value.imageUrl;
            if (image == null) {
              return Container(
                width: 250,
                height: 250,
                color: Colors.green,
              );
            } else {
              return CachedNetworkImage(
                imageUrl: image,
                width: 150,
                height: 150,
              );
            }
          },
        )),
        CustomTextField(
          label: 'Name',
          type: textFieldType.name,
        ),
        CustomTextField(
          label: 'Description',
          type: textFieldType.description,
        ),
        CustomTextField(
          label: 'Price',
          type: textFieldType.price,
        ),
        Spacer(),
        RaisedButton(onPressed: () {
          Provider.of<AdminProvider>(context, listen: false).addNewProduct();
        })
      ],
    );
  }
}

class AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<AdminProvider>(context, listen: false).getAllProducts();
    // TODO: implement build
    return Consumer<AdminProvider>(
      builder: (context, value, child) {
        List<Product> allProducts = value.allProducts;
        if (allProducts.isEmpty) {
          return Center(
            child: Text('No Products'),
          );
        } else {
          return ListView.builder(
            itemCount: allProducts.length,
            itemBuilder: (context, index) {
              return AdminProduct(product:allProducts[index])
              ;},
          );
        }
      },
    );
  }
}
