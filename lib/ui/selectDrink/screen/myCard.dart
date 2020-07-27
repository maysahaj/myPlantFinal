
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newFirebase_Project/auth.dart';
import 'package:newFirebase_Project/constant.dart';
import 'package:newFirebase_Project/models/order.dart';
import 'package:newFirebase_Project/models/products.dart';
import 'package:newFirebase_Project/provider/db_provider.dart';
import 'package:newFirebase_Project/provider/myProvider.dart';
import 'package:newFirebase_Project/provider/order_provider.dart';
import 'package:provider/provider.dart';

class MyCard extends StatelessWidget {
  String userId;

  @override
  Widget build(BuildContext context) {
    DBProvider dbProvider = Provider.of<DBProvider>(context, listen: false);
    MyProvider myProvider = Provider.of<MyProvider>(context, listen: false);
    OrderProvider orderProvider =
        Provider.of<OrderProvider>(context, listen: false);

    return Scaffold(
      backgroundColor:kBackgroundColor,
      appBar: kAppBar(
        context,
        'Card',
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete_sweep,
              color: kBackgroundColor,
              size: 35,
            ),
            onPressed: () {
              dbProvider.deleteAllProduct();
            },
          ),
        ],
      ),
      body: Consumer<DBProvider>(
        builder: (context, value, child) {
          List<Product> allProducts = value.allProducts;
          return Column(
            children: <Widget>[
              Expanded(
                flex: 8,
                child: ListView.builder(
                  itemCount: allProducts.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      actions: <Widget>[
                        IconSlideAction(
                          caption: 'Delete',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () {
                            dbProvider.deleteProduct(allProducts[index]);
                          },
                        ),
                      ],
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'Add again',
                          color: Colors.blue,
                          icon:FontAwesomeIcons.plusCircle,
                          onTap: () {
                            dbProvider.insertNewProduct(allProducts[index]);
                          },
                        ),
                      ],
                      child: ExpansionTile(
                        backgroundColor: Color(0xFFF8E8D4),
                        title: Text(
                          allProducts[index].typeCoffee,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 18,
                          ),
                        ),
                        children: <Widget>[
                          Center(
                            child: Text(
                              '${allProducts[index].typeCoffee}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: kPrimaryColor2,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Hero(
                            child: Image.asset(
                              allProducts[index].image,
                              height: 30,
                            ),
                            tag: '${allProducts[index].image}',
                          ),
                          Divider(
                            color: kPrimaryColor,
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
                                      'Price',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      '${allProducts[index].price}\$',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.brown[300],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      '${allProducts[index].numCup}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.brown[300],
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Cups',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: kPrimaryColor,
                          ),
                          Container(
                            //color: Colors.deepOrange,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Size',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                Text(
                                  allProducts[index].size == 1
                                      ? 'Small'
                                      : allProducts[index].size == 2
                                          ? 'Middle '
                                          : 'Large',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: kPrimaryColor,
                          ),
                          Container(
                            //height: 100,
                            //color: Colors.cyanAccent,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'Sugar',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  allProducts[index].sugar == 1
                                      ? 'Sugarless'
                                      : allProducts[index].sugar == 2
                                          ? 'Sugar cube '
                                          : '2 Sugar cubes',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: kPrimaryColor,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'TOTAL',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  '${allProducts[index].price * allProducts[index].numCup}\$',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  onPressed: () async {
                    userId = await Auth.auth.getUserId();

                    await orderProvider.setAllProductsMap();
                    List<Map<String, dynamic>> all =
                        orderProvider.allProductsMap;
                    myProvider.totalPrize(all);
                    myProvider.getTotalPriceInUi(myProvider.total);
                    DateTime orderTime = DateTime.now();

                    Order order = Order(
                      drinks: all,
                      totalNumber: all.length.toString(),
                      totalPrice: myProvider.total.toString(),
                      date: '${orderTime.hour}:${orderTime.minute}',
                      userId: userId,
                    );

                    orderProvider.addNewOrder(order);
                    myProvider.total = 0;

                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.SUCCES,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'Your request has been sent',
                      desc: 'total= ${myProvider.totalPriceInUi}\$',
                      btnOkOnPress: () {
                        dbProvider.deleteAllProduct();
                        Navigator.pop(context);
                      },
                    )..show();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Text(
                      'Send the request',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          );
        },
      ),
    );
  }
}
