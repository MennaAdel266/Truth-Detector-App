import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:lottie/lottie.dart';
import 'package:truth_detector_app/Layout/home_screen.dart';
import 'package:truth_detector_app/Modules/fact_image.dart';
import 'package:truth_detector_app/Modules/fake_image.dart';
import 'package:truth_detector_app/Shared/Components/colors.dart';
import 'package:truth_detector_app/Shared/Components/components.dart';
import 'package:truth_detector_app/Shared/app_localizations.dart';
import 'package:truth_detector_app/Shared/end_points.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreen();
}

class _LoadingScreen extends State<LoadingScreen> {
  var _time;
  start() {
    _time = Timer(Duration(seconds: 60), call);
  }

  void call() {
    if(data =='fake' || data=='mostly-false'){
      navigateTo(context, FakeImageScreen());
    }else if(data=='real' || data =='mostly-true' || data == 'half-true'){
      navigateTo(context, FactImageScreen());
    }
  }

  @override
  void initState() {
    start();
    super.initState();
  }

  @override
  void dispose() {
    _time.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final screenHeight= MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorConsts.grey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConsts.purple,
        automaticallyImplyLeading: false,
        title: Text(
          AppLocalizations.of(context).translate("get-result"),
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            fontFamily: 'segoepr',
            color: ColorConsts.grey,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: ()
              {
                navigateTo(context, HomeScreen());
              },
              icon: Icon(Icons.arrow_back_ios_rounded,color: ColorConsts.grey,)),
        ],
      ),
      body:SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: 55,
                color: ColorConsts.purple,
              ),
            ),
            SizedBox(
              height: screenHeight*0.1,
            ),
            Lottie.network('https://assets4.lottiefiles.com/packages/lf20_l9bcfk19.json',width: 250, height: 250,),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 42,right: 20,top: 16),
                child: Text(
                  AppLocalizations.of(context).translate("loading"),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'segoepr',
                    color:ColorConsts.darkPurple,
                  ),
                ),
              ),
            ),
            Image(
              image: AssetImage('assets/images/footer.png'),
              fit: BoxFit.cover,
              width: 360,
              height: 250,
            ),
          ],
        ),
      ),
    );
  }
}