import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truth_detector_app/Layout/home_screen.dart';
import 'package:truth_detector_app/Modules/Login_Screen/login_screen.dart';
import 'package:truth_detector_app/Modules/Signup_Screen/Cubit/cubit.dart';
import 'package:truth_detector_app/Modules/Signup_Screen/Cubit/states.dart';
import 'package:truth_detector_app/Shared/Components/colors.dart';
import 'package:truth_detector_app/Shared/Components/components.dart';
import 'package:truth_detector_app/Shared/app_localizations.dart';


class SignUpScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final screenHeight= MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.width;

    var nameController= TextEditingController();
    var emailController= TextEditingController();
    var phoneController= TextEditingController();
    var passwordController= TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => SignupCubit(),
      child: BlocConsumer<SignupCubit,SignupStates>(
        listener: (context, state)
        {
          if(state is CreateUserSuccessState){
            navigateAndFinish(context, HomeScreen());
          }
        },
        builder: (context, state)
        {
          return Scaffold(
            backgroundColor: ColorConsts.grey,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: ColorConsts.purple,
              elevation: 0,
            ),
            body: SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      ClipPath(
                        clipper: WaveClipper(),
                        child: Container(
                          padding: EdgeInsets.only(bottom: 48),
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          color: ColorConsts.purple,
                          child: Image(
                            image: AssetImage('assets/images/account.png'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:16,left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context).translate("welcome"),
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'segoepr',
                                color: ColorConsts.darkPurple,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight*0.017,
                            ),
                            defaultFormFeild(
                              controller:nameController ,
                              type: TextInputType.name,
                              validate: (String value)
                              {
                                if(value.isEmpty){
                                  return AppLocalizations.of(context).translate("enter-name");
                                }
                              },
                              label: AppLocalizations.of(context).translate("name"),
                            ),
                            SizedBox(
                              height: screenHeight*0.022,
                            ),
                            defaultFormFeild(
                              controller:emailController ,
                              type: TextInputType.emailAddress,
                              validate: (String value)
                              {
                                if(value.isEmpty){
                                  return AppLocalizations.of(context).translate("enter-email");

                                }
                              },
                              label:AppLocalizations.of(context).translate("email"),
                            ),
                            SizedBox(
                              height: screenHeight*0.022,
                            ),
                            defaultFormFeild(
                              controller:phoneController ,
                              validate: (String value)
                              {
                                if(value.isEmpty){
                                  return AppLocalizations.of(context).translate("enter-phone");
                                }
                              },
                              label: AppLocalizations.of(context).translate("phone"),

                            ),
                            SizedBox(
                              height: screenHeight*0.022,
                            ),
                            defaultFormFeild(
                              controller:emailController,
                              validate: (String value)
                              {
                                if(value.isEmpty){
                                  return AppLocalizations.of(context).translate("enter-password");
                                }
                              },
                              label: AppLocalizations.of(context).translate("password"),
                              isPassword: SignupCubit.get(context).isPassword,
                              iconButton:()
                              {
                                SignupCubit.get(context).changePasswordVisibility();
                              },
                              suffix: SignupCubit.get(context).suffix,
                            ),
                            SizedBox(
                              height: screenHeight*0.04,
                            ),
                            ConditionalBuilder(
                              condition: state is! SignupLoadingState,
                              builder: (context) => Container(
                                width: 358,
                                height: 58,
                                child: MaterialButton(
                                  child:Text(
                                    AppLocalizations.of(context).translate("continue"),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'segoepr',
                                      color: ColorConsts.grey,
                                    ),
                                  ),
                                  onPressed: ()
                                  {
                                    if(formKey.currentState.validate()){
                                      SignupCubit.get(context).userSignup(
                                        name:nameController.text ,
                                        email: emailController.text,
                                        phone: phoneController.text,
                                        password: emailController.text,
                                      );
                                      navigateTo(context, HomeScreen());
                                    }
                                  },
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: ColorConsts.purple,
                                ),
                              ),
                              fallback:(context) => Center(child: CircularProgressIndicator()),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context).translate("have-account"),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'segoepr',
                                    color: ColorConsts.darkPurple,
                                  ),
                                ),
                                TextButton(
                                  onPressed: ()
                                  {
                                    navigateTo(context, LoginScreen());
                                  },
                                  child: Text(
                                    AppLocalizations.of(context).translate("login"),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      fontFamily: 'segoepr',
                                      color: ColorConsts.darkPurple,
                                    ),
                                  ) ,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          );
        },
      ),
    );
  }
}