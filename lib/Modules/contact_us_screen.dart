import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:truth_detector_app/Layout/Cubit/cubit.dart';
import 'package:truth_detector_app/Layout/Cubit/states.dart';
import 'package:truth_detector_app/Modules/settings_screen.dart';
import 'package:truth_detector_app/Shared/Components/colors.dart';
import 'package:truth_detector_app/Shared/Components/components.dart';
import 'package:truth_detector_app/Shared/app_localizations.dart';


class ContactUsScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;


    Future<void> showAlertDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: ColorConsts.grey,
            title: Center(
              child: Text(
                AppLocalizations.of(context).translate("thank_you_message"),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'segoepr',
                  color: ColorConsts.darkPurple,
                ),
              ),
            ),
            contentPadding: EdgeInsets.only(bottom: 10,left: 15),
            content: FlatButton(
              child: Image(image: AssetImage('assets/images/correct.png'),height: 70,width: 70,),
              onPressed: (){
                navigateTo(context, SettingsScreen());
              },
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          );
        },
      );
    }

    return BlocConsumer<LayoutCubit,LayoutStates>(
      listener: (context,state)
      {},
      builder: (context,state)
      {
        var userModel = LayoutCubit.get(context).userModel;

        messageController.text=userModel.message;
        nameController.text=userModel.name;
        emailController.text=userModel.email;
        phoneController.text=userModel.phone;

        return Scaffold(
          backgroundColor: ColorConsts.grey,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ColorConsts.purple,
            automaticallyImplyLeading: false,
            title: Text(
              AppLocalizations.of(context).translate("contact-us"),
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
                onPressed: () {
                  navigateTo(context, SettingsScreen());
                },
                icon: Icon(
                  Icons.arrow_back_ios_rounded, color: ColorConsts.grey, size: 16,),
                label: Text(
                  AppLocalizations.of(context).translate("back"),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: ColorConsts.grey,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(ColorConsts.purple),
                  elevation: MaterialStateProperty.all(0),
                ),
              ),
            ],
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
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 20, left: 20, top: 25),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: nameController,
                                  keyboardType: TextInputType.name,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return AppLocalizations.of(context).translate(
                                          "enter-name");
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      fontFamily: 'segoepr',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: ColorConsts.darkPurple,
                                    ),
                                    labelText: AppLocalizations.of(context)
                                        .translate("name"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.03,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return AppLocalizations.of(context).translate(
                                          "enter-email");
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      fontFamily: 'segoepr',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: ColorConsts.darkPurple,
                                    ),
                                    labelText: AppLocalizations.of(context)
                                        .translate("email"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.03,
                                ),
                                TextFormField(
                                  controller: phoneController,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return AppLocalizations.of(context).translate(
                                          "enter-phone");
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      fontFamily: 'segoepr',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: ColorConsts.darkPurple,
                                    ),
                                    labelText: AppLocalizations.of(context)
                                        .translate("phone"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.03,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  maxLines: 8,
                                  controller: messageController,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return AppLocalizations.of(context).translate(
                                          "enter-message");
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      fontFamily: 'segoepr',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: ColorConsts.darkPurple,
                                    ),
                                    labelText: AppLocalizations.of(context)
                                        .translate("message"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.045,
                                ),
                                Container(
                                  width: 358,
                                  height: 52,
                                  child: MaterialButton(
                                    child: Text(
                                      AppLocalizations.of(context).translate("contact-us"),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'segoepr',
                                        color: ColorConsts.grey,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (formKey.currentState.validate()) {
                                        nameController.text;
                                        emailController.text;
                                        phoneController.text;
                                        messageController.text;
                                        LayoutCubit.get(context).uploadUserMessage(name: nameController.text,email: emailController.text,phone: phoneController.text, message: messageController.text);
                                        showAlertDialog();
                                      }
                                    },
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: ColorConsts.purple,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image(
                            image: AssetImage('assets/images/footer.png'),
                            fit: BoxFit.cover,
                            width: 360,
                            height: 94,
                          ),
                        ],
                      ),
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
