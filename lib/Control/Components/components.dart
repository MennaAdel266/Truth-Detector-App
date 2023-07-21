import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:truth_detector_app/Control/Components/constants.dart';


Widget defaultTextButton({
  @required Function function,
  @required String text,
}) =>  TextButton(
  onPressed: function,
  child: Text(
    text.toUpperCase(),
    style: TextStyle(
      color: ColorConsts.purple,
      fontFamily: 'segoepr',
      fontSize: 10,
      fontWeight: FontWeight.bold,
    ),
  ),
);

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  @required Function function,
  @required String text,
  double raduis = 20.0,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: function,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis),
        color: background,
      ),
    );

Widget defaultFormFeild({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  Function onTap,
  bool isClickable = true,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  bool isPassword = false,
  Function iconButton,
}) =>
    TextFormField(
      onFieldSubmitted: onSubmit,
      validator: validate,
      onTap: onTap,
      onChanged: onChange,
      enabled: isClickable,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          fontFamily: 'segoepr',
          fontSize: 13,
          color: ColorConsts.darkPurpleWithOpacity,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorConsts.purple,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
          icon: Icon(suffix,color: ColorConsts.darkPurpleWithOpacity,size: 20),
          onPressed: iconButton,
        )
            : null,
      ),
    );


Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20,
    end: 20,
  ),
  child: Container(
    width: double.infinity,
    height: 1,
    color: Colors.deepPurple[200],
  ),
);

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(context, widget) =>
    Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(
      builder: (context) => widget,
    ),
          (Route<dynamic> route) => false,
    );

void showToast({
  @required String text,
  @required ToastStates state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0
    );

enum ToastStates {SUCCESS, ERROR, WARNONG}

Color chooseToastColor (ToastStates state)
{
  Color color;
  switch(state)
  {
    case ToastStates.SUCCESS:
      color =  Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNONG:
      color = Colors.amber;
      break;
  }
  return color;
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    final p0 = size.height * 0.75;
    path.lineTo(0.0, p0);

    final controlPoint = Offset(size.width * 0.2, size.height);
    final endPoint = Offset(size.width, size.height / 1.6);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

