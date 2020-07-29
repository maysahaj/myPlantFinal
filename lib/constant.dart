import 'package:flutter/material.dart';
// Colors that we use in our app
const kTextColor = Color(0xFF3C4046);

const double kDefaultPadding = 20.0;

AppBar kAppBar(BuildContext context,String title,{List<Widget> actions}){
  return AppBar(
    elevation: 0,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        color: kBackgroundColor,
      ),
    ),
    backgroundColor: kPrimaryColor,
    leading: IconButton(
      icon: Icon(
        Icons.keyboard_arrow_left,
      ),
      color: kBackgroundColor,
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    actions: actions,
  );
}




Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
Color kBackgroundColor = _colorFromHex("ffffff");
Color kPrimaryColor = _colorFromHex("05986A");
Color kPrimaryColor2 = _colorFromHex("#01714E");
const kHeadingTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w600,
);

