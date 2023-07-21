import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:truth_detector_app/Control/Components/components.dart';
import 'package:truth_detector_app/Control/Components/constants.dart';
import 'package:truth_detector_app/Control/app_localizations.dart';
import 'package:truth_detector_app/Control/end_points.dart';
import 'package:truth_detector_app/Views/Home_Screen/home_screen.dart';

class ReviewImageScreen extends StatelessWidget {


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
          AppLocalizations.of(context).translate("review"),
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'segoepr',
            color: ColorConsts.grey,
          ),
        ),
        centerTitle: true,
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
                    Image(image: AssetImage('assets/images/review.png'),width: 206,height:206),
                    Padding(
                      padding: const EdgeInsets.only(right: 20,left: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight*0.03,
                          ),
                          Text(
                            '$saveLabelImage',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'segoepr',
                              color: ColorConsts.darkPurple,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight*0.01,
                          ),
                          myDivider(),
                          SizedBox(
                            height: screenHeight*0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16,left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Reviewers Opinions:',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'segoepr',
                                    color: ColorConsts.darkPurple,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8,top: 8),
                                  child: Text(
                                    '$saveReviewImage',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'segoepr',
                                      color: ColorConsts.darkPurple,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenHeight*0.03,
                          ),
                          myDivider(),
                          SizedBox(
                            height: screenHeight*0.03,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 150),
                      child: Container(
                        width: 171,
                        height: 45,
                        child: MaterialButton(
                          child: Text(
                            AppLocalizations.of(context).translate("done"),
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'segoepr',
                              color: ColorConsts.grey,
                            ),
                          ),
                          onPressed: ()
                          {
                            navigateTo(context, HomeScreen());
                          },
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color:ColorConsts.purple,
                        ),
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/images/footer.png'),
                      fit: BoxFit.cover,
                      width: 360,
                      height: 220,
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