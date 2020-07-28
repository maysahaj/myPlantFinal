import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newFirebase_Project/constant.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('images/img/maysa.png'),

          ),
          Text(
            'mAYSA',
            style: GoogleFonts.pacifico(
              fontSize: 40.0,
              color: kPrimaryColor2,
              fontWeight: FontWeight.bold,
            ),
          ),
       
   ],
      ),
    );
  }
}
