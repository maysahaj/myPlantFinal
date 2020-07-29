
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:newFirebase_Project/constant.dart';
import 'package:newFirebase_Project/provider/myProvider.dart';
import 'package:provider/provider.dart';

import 'widgets/Login_with_google.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall:Provider.of<MyProvider>(context). spinner,
        child: Column(
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
            LoginGoogle(),
          ],
        ),
      ),
    );
  }
}