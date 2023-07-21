import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:truth_detector_app/Control/Components/components.dart';
import 'package:truth_detector_app/Control/Components/constants.dart';
import 'package:truth_detector_app/Control/app_localizations.dart';
import 'package:truth_detector_app/Views/methods_screen.dart';
import 'package:truth_detector_app/Views/sidebar_menu.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
          backgroundColor: ColorConsts.grey,
          drawer: NavDrawer(),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ColorConsts.purple,
            title: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                AppLocalizations.of(context).translate("home"),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'segoepr',
                  color: ColorConsts.grey,
                ),
              ),
            ),
            centerTitle: true,
          ),
          body: SizedBox(
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
                        SizedBox(
                          height: screenHeight * 0.1,
                        ),
                        Text(
                          AppLocalizations.of(context).translate("choose news lang"),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: ColorConsts.purple,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.09,
                        ),
                        Container(
                          width: 203,
                          height: 60,
                          child: MaterialButton(
                            onPressed: () {
                              navigateTo(context, MethodsScreen());
                            },
                            child: Text(
                              AppLocalizations.of(context).translate("english"),
                              style: TextStyle(
                                fontFamily: 'segoepr',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: ColorConsts.grey,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ColorConsts.purple,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.05,
                        ),
                        Container(
                          width: 203,
                          height: 60,
                          child: MaterialButton(
                            onPressed: () {
                              navigateTo(context, MethodsScreen());
                            },
                            child: Text(
                              AppLocalizations.of(context).translate("arabic"),
                              style: TextStyle(
                                fontFamily: 'segoepr',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: ColorConsts.grey,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ColorConsts.purple,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.0875,
                        ),
                        Image(
                          image: AssetImage('assets/images/footer.png'),
                          fit: BoxFit.cover,
                          width: 360,
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