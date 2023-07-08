import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:truth_detector_app/Layout/Cubit/cubit.dart';
import 'package:truth_detector_app/Layout/Cubit/states.dart';
import 'package:truth_detector_app/Layout/home_screen.dart';
import 'package:truth_detector_app/Modules/sidebar_menu.dart';
import 'package:truth_detector_app/Shared/Components/colors.dart';
import 'package:truth_detector_app/Shared/Components/components.dart';
import 'package:truth_detector_app/Shared/app_localizations.dart';


class ProfileScreen extends StatelessWidget {

  var nameController= TextEditingController();
  var addressController= TextEditingController();
  var phoneController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight= MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.width;

    return BlocConsumer<LayoutCubit,LayoutStates>(
      listener: (context,states){},
      builder: (context,states)
      {
        var galleryImage= LayoutCubit.get(context).galleryImage;
        var userModel= LayoutCubit.get(context).userModel;

        nameController.text=userModel.name;
        phoneController.text=userModel.phone;
        addressController.text=userModel.address;

        return Scaffold(
          backgroundColor: ColorConsts.grey,
          drawer: NavDrawer(),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ColorConsts.purple,
            title: Text(
              AppLocalizations.of(context).translate( "profile"),
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
                        CircleAvatar(
                          backgroundImage: galleryImage == null ? AssetImage('assets/images/profile.jpg') : FileImage(galleryImage),
                          radius: 80,
                        ),
                        TextButton(
                          onPressed: ()
                          {
                            LayoutCubit.get(context).getGalleryImage();
                          },
                          child: Text(
                            AppLocalizations.of(context).translate("edit"),
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'segoepr',
                              color: ColorConsts.darkPurple,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20,left: 20,top: 10),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: nameController,
                                validator: (String value)
                                {
                                  if(value.isEmpty){
                                    return AppLocalizations.of(context).translate("enter-name");
                                  }
                                },
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    fontFamily: 'segoepr',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: ColorConsts.darkPurple,
                                  ),
                                  labelText: AppLocalizations.of(context).translate("name"),
                                  hintText: 'Norhan Ali',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight*0.03,
                              ),
                              TextFormField(
                                controller: addressController,
                                validator: (String value)
                                {
                                  if(value.isEmpty){
                                    return AppLocalizations.of(context).translate("enter-address");
                                  }
                                },
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    fontFamily: 'segoepr',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: ColorConsts.darkPurple,
                                  ),
                                  labelText: AppLocalizations.of(context).translate("address"),
                                  hintText: 'Fatah st. Nasr City',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight*0.03,
                              ),
                              TextFormField(
                                controller: phoneController,
                                validator: (String value)
                                {
                                  if(value.isEmpty){
                                    return  AppLocalizations.of(context).translate("enter-phone");
                                  }
                                },
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    fontFamily: 'segoepr',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: ColorConsts.darkPurple,
                                  ),
                                  labelText:AppLocalizations.of(context).translate("phone"),
                                  hintText: '01256780114',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight*0.04,
                              ),
                              Container(
                                width: 171,
                                height: 52,
                                child: MaterialButton(
                                  child: Text(
                                    AppLocalizations.of(context).translate("save"),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'segoepr',
                                      color: ColorConsts.grey,
                                    ),
                                  ),
                                  onPressed: ()
                                  {
                                    LayoutCubit.get(context).updateUserData(name: nameController.text, phone: phoneController.text,address: addressController.text);
                                    navigateTo(context, HomeScreen());
                                  },
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:ColorConsts.purple,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image(
                          image: AssetImage('assets/images/footer.png'),
                          fit: BoxFit.cover,
                          width: 360,
                          height: 119,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
