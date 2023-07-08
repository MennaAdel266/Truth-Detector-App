import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:truth_detector_app/Modules/settings_screen.dart';
import 'package:truth_detector_app/Shared/Components/colors.dart';
import 'package:truth_detector_app/Shared/Components/components.dart';
import 'package:truth_detector_app/Shared/app_localizations.dart';


class AboutUsScreen extends StatelessWidget {

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
          AppLocalizations.of(context).translate("about-us"),
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'segoepr',
            color: ColorConsts.grey,
          ),
        ),
        centerTitle: true,
        actions: [
          ElevatedButton.icon(
            onPressed: ()
            {
              navigateTo(context, SettingsScreen());
            },
            icon:Icon(Icons.arrow_back_ios_rounded,color: ColorConsts.grey,size: 16,),
            label: Text(
              AppLocalizations.of(context).translate("back"),
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: ColorConsts.grey,
              ),
            ),
            style: ButtonStyle(
              backgroundColor:MaterialStateProperty.all(ColorConsts.purple),
              elevation: MaterialStateProperty.all(0),
            ),
          ),
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 22,left: 22,top: 25),
                      child: Column(
                        children: [
                          Text(
                            AppLocalizations.of(context).translate("about"),
                            style: TextStyle(
                              fontSize: 17,
                              wordSpacing: 2.5,
                              color: ColorConsts.darkPurple,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight*0.07,
                          ),
                          Container(
                            height: 143,
                            width:358 ,
                            decoration: BoxDecoration(
                              color: HexColor("#C4C4C4"),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(23.0),
                              child: Column(
                                children: [
                                  Text(
                                    AppLocalizations.of(context).translate("contact-us"),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: ColorConsts.darkPurple,
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight*0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).translate("em:"),
                                        style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: ColorConsts.darkPurple,
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth*0.015,
                                      ),
                                      Text(
                                        'fakeorfact@gmail.com',
                                        style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: ColorConsts.darkPurple,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenHeight*0.01,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context).translate("ph:"),
                                          style: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: ColorConsts.darkPurple,
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenWidth*0.01,
                                        ),
                                        Text(
                                          '01028646922',
                                          style: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: ColorConsts.darkPurple,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ) ,
                          ),
                        ],
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/images/footer.png'),
                      fit: BoxFit.cover,
                      width: 360,
                      height: 196.4,
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