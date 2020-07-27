
import 'package:newFirebase_Project/constant.dart';
import 'package:newFirebase_Project/ui/loginAndRegistar/screen/loginScreen.dart';
import 'package:newFirebase_Project/ui/loginAndRegistar/screen/registarScreen.dart';
import 'package:flutter/material.dart';

class LoginAndRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
                 color: kPrimaryColor2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ));
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.center,
                child: Text(
                  'Register',
                  style: TextStyle(color:kPrimaryColor2),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(
                    color: kPrimaryColor2,
                  ),),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.center,
                child: Text(
                  'Log In',
                  style: TextStyle(
                    color:kPrimaryColor2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
