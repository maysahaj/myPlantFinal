
import 'package:newFirebase_Project/auth.dart';
import 'package:newFirebase_Project/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newFirebase_Project/ui/choosePlant/screen/choosePlantScreen.dart';


class LoginGoogle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: FlatButton(
        color:kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36.0),
        ),
        onPressed: () async{
         final result =  await Auth.auth.loginUsingGoogle() ;
         print('$result 2222');
         result?
         Navigator.push(context, MaterialPageRoute(
           builder: (context) => ChoosePlantScreen(),
         ),
         ):print('snackBar');
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(FontAwesomeIcons.google,color: Colors.white,),
              SizedBox(width: 15,),
              Text(
                'Connect with Gmail',
                style: TextStyle(
                  color: kBackgroundColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
