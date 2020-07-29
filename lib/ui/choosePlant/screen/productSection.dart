
import 'package:newFirebase_Project/constant.dart';
import 'package:newFirebase_Project/models/products.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newFirebase_Project/ui/choosePlant/screen/CustomizePlant.dart';
import 'package:newFirebase_Project/ui/choosePlant/screen/myCliper.dart';


class ProductSection extends StatefulWidget {


  @override
  _ProductSectionState createState() => _ProductSectionState();
}
class _ProductSectionState extends State<ProductSection> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      
  children: <Widget>[ 
    Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
          itemCount: products.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white30,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[400],
                    width: 1,
                  ),
                ),
              ),
              child: ListTile(
                leading: Hero(
                  tag: '${products[index].image}',
                  child: Image.asset(
                    products[index].image,
                    width: 50,
                  ),
                ),
                title: Text(
                  products[index].typePlant,

                  style: GoogleFonts.sourceSansPro(
                    color: kPrimaryColor,
                    fontSize: 20,
                  ),
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      color: kPrimaryColor,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectCustumPlant(
                                  productA: products[index],
                                )),
                      );
                    }),
              ),
            );
          },
      
      ),),
  ],
    );
  }
}
