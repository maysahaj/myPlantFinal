
import 'package:flutter/material.dart';
import 'package:newFirebase_Project/features/admin/UI/admin_home.dart';
import 'package:newFirebase_Project/features/admin/providers/adminProvider.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  String label;
  textFieldType type;
  CustomTextField({this.label,this.type});
  @override
  Widget build(BuildContext context) {
    AdminProvider adminProvider =  Provider.of<AdminProvider>(context,listen: false);
    return TextField(
      onChanged: (value){

        if(type == textFieldType.name){
         adminProvider.setProductName(value) ;
        }else if(type == textFieldType.description){
         adminProvider.setProductDescription(value) ;
        }else if(type == textFieldType.price){
         adminProvider.setProductPrice(value) ;
        } 
      },
      showCursor: true,
      keyboardType: type == textFieldType.price
      ? TextInputType.number:TextInputType.text,
      decoration: InputDecoration(
        labelText: this.label,
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(15.0)
        )
      ),
      
    );
  }
}