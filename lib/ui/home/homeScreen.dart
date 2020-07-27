
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newFirebase_Project/constant.dart';

import 'widgets/Login_with_google.dart';
import 'widgets/login&registerButton.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Image.asset('images/img/maysa.png'),
          SizedBox(
            height: 20,
          ),
          Text(
            'Welcome To  \nOurPlants!',
             style: GoogleFonts.pacifico(
              color: kPrimaryColor,
              fontSize: 25,
              fontWeight: FontWeight.w200,
            ),
            textAlign: TextAlign.center,
         ),
          LoginAndRegister(),
          LoginGoogle(),
        ],
      ),
    );
  }
}
