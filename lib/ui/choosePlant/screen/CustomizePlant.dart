
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newFirebase_Project/constant.dart';
import 'package:newFirebase_Project/models/products.dart';
import 'package:newFirebase_Project/provider/db_provider.dart';
import 'package:newFirebase_Project/provider/myProvider.dart';
import 'package:newFirebase_Project/ui/choosePlant/screen/choosePlantScreen.dart';
import 'package:provider/provider.dart';
import 'myCard.dart';
import 'package:awesome_dialog/awesome_dialog.dart';



class SelectCustumPlant extends StatefulWidget {
  final Product productA;

  SelectCustumPlant({this.productA});

  @override
  _CustomizePlantState createState() => _CustomizePlantState();
}

class _CustomizePlantState extends State<SelectCustumPlant> {
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
            Icons.keyboard_arrow_left,
          ),
          color: kPrimaryColor2,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_horiz,
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
                      widget.productA.typePlant,
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
                        color: kPrimaryColor2,
                      ),
                    ),
                  ],
                ),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text(
                      '${provider.numPlant < 0 ? 0 : provider.numPlant}',
                      style: TextStyle(
                        fontSize: 20,
                        color: kPrimaryColor2,
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        provider.numPlant < 0
                            ? provider.numPlant = 0
                            : Provider.of<MyProvider>(context, listen: false)
                                .addNum();
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: kPrimaryColor2,
                         
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
                        provider.numPlant < 0
                            ? provider.numPlant = 0
                            : Provider.of<MyProvider>(context, listen: false)
                                .subNum();
                        setState(() {});
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: kPrimaryColor2,
                         
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
                  '${widget.productA.price * Provider.of<MyProvider>(context).numPlant}\$',
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
                  numPlant: provider.numPlant,
                  price: widget.productA.price,
                  typePlant: widget.productA.typePlant,
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
                      builder: (context) => ChoosePlantScreen(),
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