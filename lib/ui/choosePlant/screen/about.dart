import 'package:firebase_auth/firebase_auth.dart';
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
         
          Text(
            'mAYSA$EmailAuthProvider',
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
