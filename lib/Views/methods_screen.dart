import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:truth_detector_app/Control/Components/components.dart';
import 'package:truth_detector_app/Control/Components/constants.dart';
import 'package:truth_detector_app/Control/app_localizations.dart';
import 'package:truth_detector_app/Views/Add_Text/add_text_screen.dart';
import 'package:truth_detector_app/Views/Home_Screen/home_screen.dart';
import 'package:truth_detector_app/Views/camera_screen.dart';
import 'package:truth_detector_app/Views/sidebar_menu.dart';
import 'package:truth_detector_app/Views/upload_screen.dart';


class MethodsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final screenHeight= MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorConsts.grey,
      drawer: NavDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConsts.purple,
        title: Text(
          AppLocalizations.of(context).translate("method"),
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
              navigateTo(context, HomeScreen());
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
                    SizedBox(
                      height: screenHeight*0.07,
                    ),
                    Text(
                      AppLocalizations.of(context).translate("choose method"),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: ColorConsts.darkPurple,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight*0.07,
                    ),
                    Container(
                      width: 203,
                      height: 67,
                      child: MaterialButton(
                        onPressed: ()
                        {
                          navigateTo(context, CameraScreen());
                        },
                        child: Row(
                          children: [
                            Text(
                              AppLocalizations.of(context).translate("camera"),
                              style: TextStyle(
                                fontFamily: 'segoepr',
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: ColorConsts.grey,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth*0.22,
                            ),
                            Icon(Icons.camera_alt_rounded, color: ColorConsts.grey,size: 24,),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:ColorConsts.purple,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight*0.04,
                    ),
                    Container(
                      width: 203,
                      height: 67,
                      child: MaterialButton(
                        onPressed: ()
                        {
                          navigateTo(context, UploadScreen());
                        },
                        child: Row(
                          children: [
                            Text(
                              AppLocalizations.of(context).translate("upload"),
                              style: TextStyle(
                                fontFamily: 'segoepr',
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: ColorConsts.grey,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth*0.08,
                            ),
                            Icon(
                              Icons.file_upload_outlined,
                              color:ColorConsts.grey,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorConsts.purple,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight*0.04,
                    ),
                    Container(
                      width: 203,
                      height: 67,
                      child: MaterialButton(
                        onPressed: ()
                        {
                          navigateTo(context, AddText());
                        },
                        child: Row(
                          children: [
                            Text(
                              AppLocalizations.of(context).translate("add-text"),
                              style: TextStyle(
                                fontFamily: 'segoepr',
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: ColorConsts.grey,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth*0.19,
                            ),
                            Icon(Icons.text_snippet_outlined, color: ColorConsts.grey,size: 24,),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorConsts.purple,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight*0.0035,
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