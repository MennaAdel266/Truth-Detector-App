import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:truth_detector_app/Control/Components/components.dart';
import 'package:truth_detector_app/Control/Components/constants.dart';
import 'package:truth_detector_app/Control/app_localizations.dart';
import 'package:truth_detector_app/Views/Home_Screen/home_screen.dart';
import 'package:truth_detector_app/Views/review_image.dart';

class FactImageScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final screenHeight= MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.width;

    return Scaffold(
      body:SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHeight*0.26,
                    ),
                    Lottie.network('https://assets4.lottiefiles.com/packages/lf20_YbAxBJ.json',width: 150, height: 150,),
                    Image(image: AssetImage('assets/images/fact.png'),height: 61,width: 140,),
                    SizedBox(
                      height: screenHeight*0.16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 58,
                          child: OutlinedButton(
                            child: Text(
                              AppLocalizations.of(context).translate("done"),
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'segoepr',
                                color:ColorConsts.grey,
                              ),
                            ),
                            onPressed: () {
                              navigateTo(context, HomeScreen());
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: ColorConsts.grey),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth*0.04,
                        ),
                        Container(
                          width: 150,
                          height: 58,
                          child: MaterialButton(
                            child: Text(
                              AppLocalizations.of(context).translate("review"),
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'segoepr',
                                color: ColorConsts.darkPurple,
                              ),
                            ),
                            onPressed: ()
                            {
                              navigateTo(context, ReviewImageScreen());
                            },
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color:ColorConsts.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}