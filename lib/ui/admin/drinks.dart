
import 'package:flutter/material.dart';
import 'package:newFirebase_Project/constant.dart';
import 'package:newFirebase_Project/models/order.dart';

class Drinks extends StatelessWidget {
final Order order;
Drinks({ this.order});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kBackgroundColor,
      appBar: kAppBar(
        context,
        'Card',
      ),
      body:
      Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: ListView.builder(
              itemCount: order.plants.length,
              itemBuilder: (context, index2) {
                return ExpansionTile(
                  backgroundColor: Color(0xFFF8E8D4),
                  title: Text(
                    order.plants[index2]['typePlant'],
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 18,
                    ),
                  ),
                  children: <Widget>[
                    Center(
                      child: Text(
                        '${order.plants[index2]['typePlant']}',
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
                                  color: kPrimaryColor2,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${order.plants[index2]['priceColumn']}\$',
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
                                '${order.plants[index2]['numPlantColumn']}',
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
                                  color: kPrimaryColor2,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    Container(
                      //color: Colors.deepOrange,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Size',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: kPrimaryColor2,
                            ),
                          ),
                          Text(
                            order.plants[index2]['sizeColumn'] == 1
                                ? 'Small'
                                : order.plants[index2]['sizeColumn'] == 2
                                    ? 'Middle '
                                    : 'Large',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: kPrimaryColor2,
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
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                                  color: kPrimaryColor2,
                                ),
                              ),
                            ],
                          ),
                       ],
                      ),
                    ),
                    Divider(
                      color: kPrimaryColor,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                            '${order.plants[index2]['priceColumn'] * order.plants[index2]['numPlantColumn']}\$',
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
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
