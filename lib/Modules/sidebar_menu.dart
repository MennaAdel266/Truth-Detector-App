import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:truth_detector_app/Layout/Cubit/cubit.dart';
import 'package:truth_detector_app/Layout/Cubit/states.dart';
import 'package:truth_detector_app/Layout/home_screen.dart';
import 'package:truth_detector_app/Modules/profile_screen.dart';
import 'package:truth_detector_app/Modules/settings_screen.dart';
import 'package:truth_detector_app/Modules/welcome_screen.dart';
import 'package:truth_detector_app/Shared/Components/colors.dart';
import 'package:truth_detector_app/Shared/Components/components.dart';
import 'package:truth_detector_app/Shared/app_localizations.dart';
import 'package:truth_detector_app/Shared/end_points.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<LayoutCubit,LayoutStates>(
      listener: (context,states){},
      builder: (context,states)
      {
        var galleryImage= LayoutCubit.get(context).galleryImage;

        return Drawer(
          backgroundColor: ColorConsts.grey,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      color: ColorConsts.purple,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 220,bottom: 75),
                        child: Image(
                          image: AssetImage('assets/images/appLogp.png'),
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage: galleryImage == null ? AssetImage('assets/images/profile.jpg') : FileImage(galleryImage),
                    radius: 42,
                  ),
                ],
              ),
              Center(
                child: Text(
                  'Menna Adel',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'segoepr',
                    color: ColorConsts.darkPurple,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 25,left:25,top: 50,bottom: 8),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  color: HexColor("#D9D9D9"),
                  elevation: 3,
                  child: ListTile(
                    leading: Icon(Icons.home_filled,color: ColorConsts.darkPurple,),
                    title: Text(
                      AppLocalizations.of(context).translate("home"),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'segoepr',
                        color: ColorConsts.darkPurple,
                      ),),
                    onTap: () =>
                    {
                      navigateTo(context,HomeScreen())
                    },
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 25,left:25,bottom: 8),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  color: HexColor("#D9D9D9"),
                  elevation: 3,
                  child: ListTile(
                    leading: Icon(Icons.perm_identity_outlined,color: ColorConsts.darkPurple,),
                    title: Text(
                      AppLocalizations.of(context).translate("profile"),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'segoepr',
                        color: ColorConsts.darkPurple,
                      ),),
                    onTap: () =>
                    {
                      navigateTo(context,ProfileScreen())
                    },
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 25,left:25,bottom: 8),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  color: HexColor("#D9D9D9"),
                  elevation: 3,
                  child: ListTile(
                    leading: Icon(Icons.settings,color: ColorConsts.darkPurple,),
                    title: Text(
                      AppLocalizations.of(context).translate("settings"),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'segoepr',
                        color: ColorConsts.darkPurple,
                      ),),
                    onTap: () =>
                    {
                      navigateTo(context,SettingsScreen())
                    },
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 25,left:25,bottom: 8),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  color: HexColor("#D9D9D9"),
                  elevation: 3,
                  child: ListTile(
                    leading: Icon(Icons.logout_outlined,color: ColorConsts.darkPurple,),
                    title: Text(
                      AppLocalizations.of(context).translate("logout"),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'segoepr',
                        color: ColorConsts.darkPurple,
                      ),),
                    onTap: () =>
                    {
                      navigateTo(context,WelcomeScreen())
                    },
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.038,
              ),
              Image(
                image: AssetImage('assets/images/footer.png'),
                fit: BoxFit.cover,
              ),
            ],
          ),
        );
      },
    );
  }
}