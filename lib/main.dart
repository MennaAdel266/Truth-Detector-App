import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truth_detector_app/Layout/Cubit/cubit.dart';
import 'package:truth_detector_app/Layout/home_screen.dart';
import 'package:truth_detector_app/Modules/Login_Screen/login_screen.dart';
import 'package:truth_detector_app/Modules/splash_screen.dart';
import 'package:truth_detector_app/Shared/Components/colors.dart';
import 'package:truth_detector_app/Shared/Components/constants.dart';
import 'package:truth_detector_app/Shared/Cubit/cubit.dart';
import 'package:truth_detector_app/Shared/Cubit/states.dart';
import 'package:truth_detector_app/Shared/Network/local/cache_helper.dart';
import 'package:truth_detector_app/Shared/Network/remote/dio_helper.dart';
import 'package:truth_detector_app/Shared/app_localizations.dart';
import 'package:truth_detector_app/Shared/bloc_observer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  await Firebase.initializeApp()
      .then((value) => print("connected " + value.options.asMap.toString()))
      .catchError((e) => print(e.toString()));

  Widget widget;

  uId = CacheHelper.getData(key: 'uId');

  if(uId != null){
    widget = HomeScreen();
  }else{
    widget = LoginScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {

  final Widget startWidget;

  MyApp({
    this.startWidget,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:[
          BlocProvider(create: (BuildContext context) => LayoutCubit() ..getUserData()),
          BlocProvider(create: (context) => LocaleCubit() ..getSavedLanguage()),
        ],
      child: BlocBuilder<LocaleCubit,ChangeLocaleState>(
        builder:(context, state){
          return MaterialApp(
            locale: state.locale,
            supportedLocales: [ Locale('en'), Locale('ar'),],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales){
              for (var locale in supportedLocales) {
                if (deviceLocale != null &&
                    deviceLocale.languageCode == locale.languageCode) {
                  return deviceLocale;
                }
              }
              return supportedLocales.first;
            },
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              textTheme: TextTheme(
                  subtitle1: TextStyle(
                    color: ColorConsts.darkPurpleWithOpacity,
                  )
              ),
              inputDecorationTheme: InputDecorationTheme(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:ColorConsts.purple,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:ColorConsts.purple),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            home:startWidget,
          );
        },
      ),
    );
  }
}