import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:truth_detector_app/Control/Components/components.dart';
import 'package:truth_detector_app/Control/Components/constants.dart';
import 'package:truth_detector_app/Control/app_localizations.dart';
import 'package:truth_detector_app/Views/Login_Screen/login_screen.dart';
import 'package:truth_detector_app/Views/Signup_Screen/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final screenHeight= MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorConsts.purple,
      body:SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image(image: AssetImage('assets/images/welcome.png'),width: 285,height: 315,),
              ),
              Text(
                'Fake News Detection',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'segoepr',
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: screenHeight*0.012,
              ),
              Text(
                AppLocalizations.of(context).translate("bio"),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: screenHeight*0.05,
              ),
              Container(
                width: 358,
                height: 58,
                child: MaterialButton(
                  child:Text(
                    AppLocalizations.of(context).translate("account"),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'segoepr',
                      color: ColorConsts.darkPurple,
                    ),
                  ),
                  onPressed: ()
                  {
                    navigateTo(context, LoginScreen());
                  },
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorConsts.grey,
                ),
              ),
              SizedBox(
                height: screenHeight*0.03,
              ),
              Container(
                width: 358,
                height: 58,
                child: OutlinedButton(
                  child:Text(
                    AppLocalizations.of(context).translate("create"),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'segoepr',
                      color: HexColor('#F5F5F5'),
                    ),
                  ),
                  onPressed: ()
                  {
                    navigateTo(context, SignUpScreen());
                  },
                  style: OutlinedButton.styleFrom(side: BorderSide(color: HexColor('#F5F5F5')),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}