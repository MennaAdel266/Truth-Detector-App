import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:truth_detector_app/Modules/about_us_screen.dart';
import 'package:truth_detector_app/Modules/contact_us_screen.dart';
import 'package:truth_detector_app/Modules/rate_us_screen.dart';
import 'package:truth_detector_app/Modules/sidebar_menu.dart';
import 'package:truth_detector_app/Modules/welcome_screen.dart';
import 'package:truth_detector_app/Shared/Components/colors.dart';
import 'package:truth_detector_app/Shared/Components/components.dart';
import 'package:truth_detector_app/Shared/Cubit/cubit.dart';
import 'package:truth_detector_app/Shared/Cubit/states.dart';
import 'package:truth_detector_app/Shared/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
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
        title: Text(
          AppLocalizations.of(context).translate("settings"),
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'segoepr',
            color: ColorConsts.grey,
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
            Image(
                image: AssetImage('assets/images/settings.png'),
                width: 240,
                height: 220),
            Container(
              height: 85,
              width: 356,
              padding: const EdgeInsets.only(right: 16, left: 16, top: 15, bottom: 8),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                color: HexColor("#D9D9D9"),
                elevation: 3,
                child:BlocConsumer<LocaleCubit,ChangeLocaleState>(
                  listener: (context, state) {},
                  builder: (context, state)
                  {
                    return DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: state.locale.languageCode,
                        dropdownColor: HexColor("#CFCFCF"),
                        iconEnabledColor: ColorConsts.darkPurple,
                        isExpanded: true,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'segoepr',
                          color: ColorConsts.darkPurple,
                        ),
                        icon: const Icon(Icons.arrow_drop_down_rounded, size: 35,),
                        items: ['ar', 'en'].map((String items) {
                          return DropdownMenuItem<String>(
                            value: items,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16,right: 16),
                              child: Row(
                                children: [
                                  Icon(Icons.language_rounded, color: ColorConsts.darkPurple,),
                                  SizedBox(
                                    width: screenWidth*0.1,
                                  ),
                                  Text(items),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          if (newValue != null) {
                            context.read<LocaleCubit>().changeLanguage(newValue);
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 16, left: 16, bottom: 8),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: HexColor("#D9D9D9"),
                elevation: 3,
                child: ListTile(
                  leading: Icon(
                    Icons.phone_rounded,
                    color: ColorConsts.darkPurple,
                  ),
                  title: Text(
                    AppLocalizations.of(context).translate("contact-us"),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'segoepr',
                      color: ColorConsts.darkPurple,
                    ),
                  ),
                  onTap: () => {navigateTo(context, ContactUsScreen())},
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 16, left: 16, bottom: 8),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: HexColor("#D9D9D9"),
                elevation: 3,
                child: ListTile(
                  leading: Image(
                    image: AssetImage('assets/images/exclamation_mark .png'),
                    width: 21,
                    height: 21,
                  ),
                  title: Text(
                    AppLocalizations.of(context).translate("about-us"),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'segoepr',
                      color: ColorConsts.darkPurple,
                    ),
                  ),
                  onTap: () => {navigateTo(context, AboutUsScreen())},
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 16, left: 16, bottom: 8),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: HexColor("#D9D9D9"),
                elevation: 3,
                child: ListTile(
                  leading: Icon(
                    Icons.rate_review_outlined,
                    color: ColorConsts.darkPurple,
                  ),
                  title: Text(
                    AppLocalizations.of(context).translate("rate-us"),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'segoepr',
                      color: ColorConsts.darkPurple,
                    ),
                  ),
                  onTap: () => {navigateTo(context, RateUsScreen())},
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 16, left: 16, bottom: 8),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: HexColor("#D9D9D9"),
                elevation: 3,
                child: ListTile(
                  leading: Icon(
                    Icons.logout_outlined,
                    color: ColorConsts.darkPurple,
                  ),
                  title: Text(
                    AppLocalizations.of(context).translate("logout"),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'segoepr',
                      color: ColorConsts.darkPurple,
                    ),
                  ),
                  onTap: () => {navigateTo(context, WelcomeScreen())},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
