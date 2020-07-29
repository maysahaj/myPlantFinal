
import 'package:newFirebase_Project/SearchBox.dart';
import 'package:newFirebase_Project/constant.dart';
import 'package:flutter/material.dart';
import 'package:newFirebase_Project/ui/choosePlant/screen/myCliper.dart';
import 'package:newFirebase_Project/ui/choosePlant/screen/productSection.dart';


class ProductSectionpage extends StatefulWidget {


  @override
  _ProductSectionState createState() => _ProductSectionState();
}
class _ProductSectionState extends State<ProductSectionpage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
  children: <Widget>[ 
      Container(child:new Column(
        children: <Widget>[
          
          ClipPath(clipper: MyClipper(),     
            child:Container(
            height: 250,
            width: double.infinity,

             decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              kPrimaryColor,
              kPrimaryColor,
              kPrimaryColor,
              kPrimaryColor,
              kPrimaryColor
            ],
          
          ),
        

           image: DecorationImage(
            image: AssetImage("assets/images/maysa.png"),
          ),
            
          ),
             child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
           
            SizedBox(child:Center(
             child: Text("Our Plants",style: TextStyle(
                          fontFamily: 'Raleway-Bold',
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),),
                        
           )),
           SizedBox(child:Center(
             child:  Text(
                        'Lorem Ipsum Dammy Plants',textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Raleway-Regular',
                          fontSize: 15.0,
                          
                          color: Colors.white
                        ),
           ),
            
           ),
           ),
     ]   
          ),
          
          ),
          ),
           Flexible(child: Searchpage()), 
           new Padding(padding: const EdgeInsets.all(20.0),
            child: Container(
              
                alignment: Alignment.centerLeft,
                child: new Text('Recent Plants',style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,))),),

          //grid view
          Flexible(child: ProductSection()),  
      ],
        )
        ), 
    
 ],
    );
  }
}
