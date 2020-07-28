import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newFirebase_Project/constant.dart';
import 'package:newFirebase_Project/models/order.dart';
import 'package:newFirebase_Project/provider/myProvider.dart';
import 'package:newFirebase_Project/provider/order_provider.dart';
import 'package:newFirebase_Project/repositories/orderClient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    return FutureBuilder<List<Order>>(
      future: Provider.of<OrderProvider>(context).getAllOrder(),
      builder: (BuildContext context, AsyncSnapshot<List<Order>> snapshot) {
        if (snapshot.hasData) {
          List<Order> order = snapshot.data;
          if (order.length > 0) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'images/img/back3.jpg'
                  ),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: ListView.builder(
                      itemCount: order.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          actions: <Widget>[
                            IconSlideAction(
                              caption: 'Delete',
                              color: kPrimaryColor2,
                              icon: Icons.delete,
                              onTap: () async {
                                QuerySnapshot querySnapshot = await OrderClient
                                    .orderClient
                                    .getQuerySnapshotOrder();
                                await orderProvider.deleteOrder(
                                    querySnapshot.documents[index].documentID);
                              },
                            ),
                          ],
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: 'Add again',
                              color: Colors.blue,
                              icon: FontAwesomeIcons.plusCircle,
                              onTap: () async {
                                await orderProvider
                                    .addNewOrder(order[index]);
                                await orderProvider.getAllOrder();
                              },
                            ),
                          ],
                          child: ExpansionTile(
                            initiallyExpanded: Provider.of<MyProvider>(context)
                                    .selectExpansionTile ==
                                index,
                            backgroundColor: Color(0xFFF8E8D4),
                            onExpansionChanged: (value) {
                              if (value) {
                                Provider.of<MyProvider>(context, listen: false)
                                    .toggleSelectExpansionTile(index);
                              } else {
                                Provider.of<MyProvider>(context, listen: false)
                                    .toggleSelectExpansionTile(-2);
                              }
                            },
                            title: Text(
                              'Order ${index + 1}',
                              style: GoogleFonts.roboto(
                                color: kPrimaryColor,
                                fontSize: 20,
                              ),
                            ),
                            children: <Widget>[
                              Center(
                                child: Text(
                                  'Order${index + 1}',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: kPrimaryColor2,
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Divider(
                                  color: kPrimaryColor,
                                ),
                                width: 100,
                              ),
                              Container(
                                child: ListTile(
                                  title: Text(
                                    'Drinks',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: kPrimaryColor2,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.mugHot,
                                      size: 30,
                                      color: kPrimaryColor,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            backgroundColor: Color(0xFFF0F0EC),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0))),
                                            title: Text(
                                              'Drinks',
                                              style: GoogleFonts.sourceSansPro(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                                color: kPrimaryColor2,
                                              ),
                                            ),
                                            content: Container(
                                              height: 100,
                                              child: ListView.builder(
                                                itemCount: order[index]
                                                    .drinks
                                                    .length,
                                                itemBuilder: (context, index2) {
                                                  return Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Text(
                                                          '${order[index].drinks[index2]['typeCoffee']}',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                            color:
                                                                kPrimaryColor2,
                                                          ),
                                                        ),
//                                              SizedBox(width: 5),
                                                        Text(
                                                          '${order[index].drinks[index2]['numCupColumn']} Cups',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18,
                                                            color:
                                                                kPrimaryColor2,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                child: Divider(
                                  color: kPrimaryColor,
                                ),
                                width: 320,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Number of Drinks',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: kPrimaryColor2,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '${order[index].totalNumber} Cups',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: kPrimaryColor2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Divider(
                                  color: kPrimaryColor,
                                ),
                                width: 320,
                              ),
                              Container(
                                //color: Colors.deepOrange,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Status',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: kPrimaryColor2,
                                      ),
                                    ),
                                    Text(
                                      order[index].status,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: kPrimaryColor2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Divider(
                                  color: kPrimaryColor,
                                ),
                                width: 320,
                              ),
                              Container(
                                //height: 100,
                                //color: Colors.cyanAccent,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Request time',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: kPrimaryColor2,
                                      ),
                                    ),
                                    Text(
                                      '${order[index].date}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: kPrimaryColor2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Divider(
                                  color: kPrimaryColor,
                                ),
                                width: 320,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      '${order[index].totalPrice}\$',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: kPrimaryColor2,
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
                ],
              ),
            );
          } else {
            return Center(
              child: Text('No Order',
                style: GoogleFonts.sourceSansPro(
                color: kPrimaryColor,
                fontSize: 20,
              ),),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
