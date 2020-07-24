
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newFirebase_Project/componants/models/product.dart';
import 'package:newFirebase_Project/features/admin/providers/adminProvider.dart';
import 'package:provider/provider.dart';

class AdminProduct extends StatelessWidget {
  Product product;
  AdminProduct({this.product});

  @override
  Widget build(BuildContext context) {
    return Dismissible(key:UniqueKey(),onDismissed: (direction){
      Provider.of<AdminProvider>(context,listen: false).deleteProduct(product.documentId);
    },
          child: Card(
        child: ListTile(
          leading:CircleAvatar(backgroundImage: CachedNetworkImageProvider(product.imageUrl),)
          ,title: Text(product.name),
          trailing: IconButton(icon:Icon(Icons.edit),onPressed: (){},),
        ),

      ),
    );
  }
}