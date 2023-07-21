import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:truth_detector_app/Control/Components/components.dart';
import 'package:truth_detector_app/Control/Components/constants.dart';
import 'package:truth_detector_app/Control/app_localizations.dart';
import 'package:truth_detector_app/Views/Home_Screen/Cubit/cubit.dart';
import 'package:truth_detector_app/Views/Home_Screen/Cubit/states.dart';
import 'package:truth_detector_app/Views/settings_screen.dart';


class RateUsScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  var commentController= TextEditingController();

  @override
  Widget build(BuildContext context) {

    Future<void> showAlertDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: ColorConsts.grey,
            title: Center(
              child: Text(
                AppLocalizations.of(context).translate("thank_you"),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'segoepr',
                  color: ColorConsts.darkPurple,
                ),
              ),
            ),
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

    final screenHeight= MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.width;

    return BlocConsumer<LayoutCubit,LayoutStates>(
      listener: (context, state){},
      builder: (context, state)
      {
        var userModel = LayoutCubit.get(context).userModel;

        commentController.text=userModel.comment;

        return Scaffold(
          backgroundColor: ColorConsts.grey,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ColorConsts.purple,
            automaticallyImplyLeading: false,
            title: Text(
              AppLocalizations.of(context).translate("rate-us"),
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
                        Image(image: AssetImage('assets/images/rate.png'),width: 206,height:154),
                        Padding(
                          padding: const EdgeInsets.only(right: 20,left: 20),
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: screenHeight*0.07,
                                ),
                                Text(
                                  AppLocalizations.of(context).translate("add-comment"),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'segoepr',
                                    color: ColorConsts.darkPurple,
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight*0.015,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  maxLines: 4,
                                  controller: commentController,
                                  validator: (String value)
                                  {
                                    if(value.isEmpty){
                                      return AppLocalizations.of(context).translate("enter-comment");
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      fontFamily: 'segoepr',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: ColorConsts.darkPurple,
                                    ),
                                    labelText: AppLocalizations.of(context).translate("comment"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight*0.03,
                                ),
                              ],
                            ),
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
                                if(formKey.currentState.validate()){
                                  commentController.text;
                                  LayoutCubit.get(context).uploadUserComment(comment: commentController.text);
                                  showAlertDialog();
                                }
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
                          height: 210,
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