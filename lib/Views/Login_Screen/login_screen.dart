import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truth_detector_app/Control/Components/components.dart';
import 'package:truth_detector_app/Control/Components/constants.dart';
import 'package:truth_detector_app/Control/Network/local/cache_helper.dart';
import 'package:truth_detector_app/Control/app_localizations.dart';
import 'package:truth_detector_app/Views/Home_Screen/home_screen.dart';
import 'package:truth_detector_app/Views/Login_Screen/Cubit/cubit.dart';
import 'package:truth_detector_app/Views/Login_Screen/Cubit/states.dart';
import 'package:truth_detector_app/Views/Signup_Screen/signup_screen.dart';



class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(
              text: state.error,
              state: ToastStates.ERROR,
            );
          }
          if (state is LoginSuccessState) {
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value) {
              navigateAndFinish(
                context,
                HomeScreen(),
              );
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorConsts.grey,
            appBar: AppBar(
              backgroundColor: ColorConsts.purple,
              elevation: 0,
              automaticallyImplyLeading: false,
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
                          height: 230,
                          color: ColorConsts.purple,
                          child: Image(
                            image: AssetImage('assets/images/account.png'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:16, left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context).translate("welcome-back"),
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'segoepr',
                                color: ColorConsts.darkPurple,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight*0.02,
                            ),
                            defaultFormFeild(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              validate: (String value) {
                                if (value.isEmpty) {

                                  return AppLocalizations.of(context).translate("enter-email");

                                }
                              },
                              label: AppLocalizations.of(context).translate("email-or-phone"),
                            ),
                            SizedBox(
                              height: screenHeight*0.05,
                            ),
                            defaultFormFeild(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return  AppLocalizations.of(context).translate( "enter-password");
                                }
                              },
                              label: AppLocalizations.of(context).translate( "password"),
                              isPassword: LoginCubit.get(context).isPassword,
                              iconButton: () {
                                LoginCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              suffix: LoginCubit.get(context).suffix,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 199),
                              child: defaultTextButton(
                                function: () {
                                  navigateTo(context, HomeScreen());
                                },
                                text: AppLocalizations.of(context).translate("forget-password"),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight*0.025,
                            ),
                            ConditionalBuilder(
                              condition: state is! LoginLoadingState,
                              builder: (context) => Container(
                                width: 358,
                                height: 58,
                                child: MaterialButton(
                                  child: Text(
                                    AppLocalizations.of(context).translate( "continue"),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'segoepr',
                                      color:ColorConsts.grey ,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState.validate()) {
                                      LoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                      if (state is LoginSuccessState) {
                                        showToast(
                                          text: state.success,
                                          state: ToastStates.SUCCESS,
                                        );
                                        navigateTo(context, HomeScreen());
                                      }
                                    }
                                  },
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: ColorConsts.purple,
                                ),
                              ),
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator()),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context).translate( "no-account"),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'segoepr',
                                    color: ColorConsts.purple,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    navigateTo(context, SignUpScreen());
                                  },
                                  child: Text(
                                    AppLocalizations.of(context).translate("signup"),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'segoepr',
                                      color: ColorConsts.purple,
                                    ),
                                  ),
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