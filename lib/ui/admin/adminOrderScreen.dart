
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newFirebase_Project/auth.dart';
import 'package:newFirebase_Project/constant.dart';
import 'package:newFirebase_Project/models/order.dart';
import 'package:newFirebase_Project/provider/myProvider.dart';
import 'package:newFirebase_Project/provider/order_provider.dart';
import 'package:newFirebase_Project/ui/admin/plants.dart';
import 'package:newFirebase_Project/ui/home/homeScreen.dart';
import 'package:provider/provider.dart';

class AdminOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Flutter Plants',
          style: GoogleFonts.pacifico(
            color: kPrimaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w200,
          ),
        ),
        backgroundColor: kPrimaryColor2,
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.signOutAlt,
          ),
          color: kBackgroundColor,
          onPressed: () async {
//              await Provider.of<OrderProvider>(context,listen: false).deleteAllOrder() ;
            Auth.auth.signOut();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
          },
        ),
      ),
      body: FutureBuilder<List<Order>>(
        future: Provider.of<OrderProvider>(context).getAllOrderAdmin(),
        builder: (BuildContext context, AsyncSnapshot<List<Order>> snapshot) {
          if (snapshot.hasData) {
            List<Order> orders = snapshot.data;
            if (orders.length > 0) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF0F0EC),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'images/img/back3.jpg',
                    ),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 8,
                      child: ListView.builder(
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          return Slidable(
                            actionPane: SlidableDrawerActionPane(),
                            actionExtentRatio: 0.25,
                            actions: <Widget>[
                              Visibility(
                                child: IconSlideAction(
                                  caption: 'Delete',
                                  color: Colors.red,
                                  icon: Icons.delete,
                                  onTap: () async {
                                    await orderProvider.deleteOrder(orders[index].docId);
                                  },
                                ),
                              ),
                            ],
                            child: ExpansionTile(
                              initiallyExpanded:
                                  Provider.of<MyProvider>(context)
                                          .selectExpansionTile ==
                                      index,
                              backgroundColor: kBackgroundColor,
                              onExpansionChanged: (value) {
                                if (value) {
                                  Provider.of<MyProvider>(context,
                                          listen: false)
                                      .toggleSelectExpansionTile(index);
                                } else {
                                  Provider.of<MyProvider>(context,
                                          listen: false)
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
                                      'plants',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: kPrimaryColor2,
                                      ),
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.leaf,
                                        size: 30,
                                        color: kPrimaryColor,
                                      ),
                                      onPressed: () {
                                        Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return Plants(order: orders[index],);
                                        },)
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
                                        'Number of Plants',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: kPrimaryColor2,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '${orders[index].totalPrice} plants',
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
                                        '${orders[index].date}',
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
                                        '${orders[index].totalNumber} plants\$',
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
                child: Text(
                  'No Order',
                  style: GoogleFonts.sourceSansPro(
                    color: kPrimaryColor,
                    fontSize: 20,
                  ),
                ),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}