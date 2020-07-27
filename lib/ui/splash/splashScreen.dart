import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newFirebase_Project/constant.dart';


class Splash extends StatefulWidget {
 final  Widget screen;

  Splash(this.screen);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    var delay = Duration(seconds: 20);
    Future.delayed(delay, () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return widget.screen;
        },
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        
            children: <Widget>[
              Container(              
                child: Center(child: Image.asset('assets/images/p2.png')),
               ),
              Container(
                  padding: EdgeInsets.all(50.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "Our Plants",style:
                  GoogleFonts.pacifico(
              color: kPrimaryColor,
              fontSize: 35,
              fontWeight: FontWeight.w200,
            ),
                ),
                ),
 
  ],
)
    );
  }
}



