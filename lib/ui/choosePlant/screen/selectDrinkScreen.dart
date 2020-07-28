import 'package:newFirebase_Project/auth.dart';
import 'package:newFirebase_Project/constant.dart';
import 'package:newFirebase_Project/ui/home/homeScreen.dart';
import 'package:newFirebase_Project/ui/choosePlant/screen/map.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'about.dart';
import 'allOrderScreen.dart';
import 'myCard.dart';
import 'productSection.dart';

class SelectDrinkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'OurPlants',
            style: GoogleFonts.pacifico(
              color: kBackgroundColor,
              fontSize: 25,
              fontWeight: FontWeight.w200,
            ),
          ),
          backgroundColor: kPrimaryColor2,
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left
            ),
            color: kBackgroundColor,
            onPressed: ()async {
//              await Provider.of<OrderProvider>(context,listen: false).deleteAllOrder() ;
              Auth.auth.signOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.more_horiz,
                color:kBackgroundColor,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyCard()),
                );
              },
            ),
          ],
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            AllOrderScreen(),
             MyMap(),
            ProductSection(),
            About(),
          ],
        ),
        bottomNavigationBar:  Container(
          height: 70.0,
          color: kPrimaryColor,
          child: TabBar(
            tabs: [
              Tab(
                icon:  Icon(
                  Icons.shopping_cart,
                  color:kBackgroundColor,
                  size: 26,
                ),
              ),
              Tab(
                icon:  Icon(
                  Icons.favorite,
                  color:kBackgroundColor,
                  size: 26,
                ),
              ),
              Tab(
                icon:  Icon(
                  FontAwesomeIcons.home,
                  color: kBackgroundColor,
                  size: 26,
                ),
              ),
              Tab(
                icon:  Icon(
                  FontAwesomeIcons.userAlt,
                  color: kBackgroundColor,
                  size: 26,
                  
                ),
              )
            ],
            indicatorColor: kBackgroundColor,
            
          ),
        ),
      ),
    );
  }
}
