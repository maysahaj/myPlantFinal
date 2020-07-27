
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newFirebase_Project/constant.dart';
import 'package:newFirebase_Project/models/products.dart';
import 'package:newFirebase_Project/provider/db_provider.dart';
import 'package:newFirebase_Project/provider/myProvider.dart';
import 'package:provider/provider.dart';
import 'myCard.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'selectDrinkScreen.dart';


class CustomizeDrink extends StatefulWidget {
  final Product productA;

  CustomizeDrink({this.productA});

  @override
  _CustomizeDrinkState createState() => _CustomizeDrinkState();
}

class _CustomizeDrinkState extends State<CustomizeDrink> {
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    DBProvider cardProvider = Provider.of<DBProvider>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'your plants choice',
          style: TextStyle(
            color: kPrimaryColor2,
          ),
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          color: kPrimaryColor2,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.listAlt,
              color: kPrimaryColor,
              size: 35,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCard()),
              );
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors:[kPrimaryColor2,kPrimaryColor,kPrimaryColor2,kPrimaryColor2]),
            ),
            child: Center(
              child: Hero(
                tag: '${widget.productA.image}',
                child: Image.asset(
                  widget.productA.image,
                  height: 120,
                  
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            //height: 100,
            //color: Colors.cyanAccent,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.productA.typeCoffee,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: kPrimaryColor2,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${widget.productA.price}\$',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.brown[300],
                      ),
                    ),
                  ],
                ),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text(
                      '${provider.numCup < 0 ? 0 : provider.numCup}',
                      style: TextStyle(
                        fontSize: 20,
                        color: kPrimaryColor2,
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        provider.numCup < 0
                            ? provider.numCup = 0
                            : Provider.of<MyProvider>(context, listen: false)
                                .addNum();
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: kPrimaryColor2,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            bottomLeft: Radius.circular(40.0),
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.grey[100],
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        provider.numCup < 0
                            ? provider.numCup = 0
                            : Provider.of<MyProvider>(context, listen: false)
                                .subNum();
                        setState(() {});
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: kPrimaryColor2,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                          ),
                        ),
                        child: Icon(
                          Icons.remove,
                          color: Colors.grey[100],
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
          Container(
            //color: Colors.deepOrange,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Size',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: kPrimaryColor2,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                              color: Provider.of<MyProvider>(context,
                                              listen: false)
                                          .size ==
                                      1
                                  ? kPrimaryColor
                                  : Colors.white)),
                      child: IconButton(
                          icon: Text('lg',style:TextStyle(color: kPrimaryColor2,fontSize: 20.0,fontWeight: FontWeight.bold),),
                          onPressed: () {
                            Provider.of<MyProvider>(context, listen: false)
                                .selectNumSize(num: 1);
                          }),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                              color: Provider.of<MyProvider>(context,
                                              listen: false)
                                          .size ==
                                      2
                                  ? kPrimaryColor2
                                  : Colors.white)),
                      child: IconButton(
                          icon: Text('md',style:TextStyle(color: kPrimaryColor2,fontSize: 20.0,fontWeight: FontWeight.bold),),
                          onPressed: () {
                            Provider.of<MyProvider>(context, listen: false)
                                .selectNumSize(num: 2);
                          }),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                              color: Provider.of<MyProvider>(context,
                                              listen: false)
                                          .size ==
                                      3
                                  ? kPrimaryColor
                                  : Colors.white)),
                      child: IconButton(
                          icon: Text('sm',style:TextStyle(color: kPrimaryColor2,fontSize: 20.0,fontWeight: FontWeight.bold),),
                          onPressed: () {
                            Provider.of<MyProvider>(context, listen: false)
                                .selectNumSize(num: 3);
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            //height: 100,
            //color: Colors.cyanAccent,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            ),
          ),
          Container(
            //height: 100,
            color: Colors.grey[300],
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'TOTAL',
                  style: TextStyle(
                    color: kPrimaryColor2,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '${widget.productA.price * Provider.of<MyProvider>(context).numCup}\$',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kPrimaryColor2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          FlatButton(
            onPressed: () {
              try {
                Product p = Product(
                  numCup: provider.numCup,
                  price: widget.productA.price,
                  sugar: provider.sugar,
                  typeCoffee: widget.productA.typeCoffee,
                  size: provider.size,
                  image: widget.productA.image,
                );
                Provider.of<DBProvider>(context, listen: false)
                    .insertNewProduct(p);

                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.NO_HEADER,
                  animType: AnimType.BOTTOMSLIDE,
                  title: 'Accept the order',
                  desc: 'Your order has been added',
                  btnOkOnPress: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => SelectDrinkScreen(),
                    ),);
                  },
                )..show();

              } catch (error) {
                print(error);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Text(
                'Add to Cart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}