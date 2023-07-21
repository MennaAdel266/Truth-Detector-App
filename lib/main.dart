import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truth_detector_app/Control/Components/constants.dart';
import 'package:truth_detector_app/Control/Cubit/cubit.dart';
import 'package:truth_detector_app/Control/Cubit/states.dart';
import 'package:truth_detector_app/Control/Network/local/cache_helper.dart';
import 'package:truth_detector_app/Control/Network/remote/dio_helper.dart';
import 'package:truth_detector_app/Control/app_localizations.dart';
import 'package:truth_detector_app/Control/bloc_observer.dart';
import 'package:truth_detector_app/Control/end_points.dart';
import 'package:truth_detector_app/Views/Home_Screen/Cubit/cubit.dart';
import 'package:truth_detector_app/Views/Home_Screen/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:truth_detector_app/Views/Login_Screen/login_screen.dart';
import 'package:truth_detector_app/Views/splash_screen.dart';


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
            home:SplashScreen(),
          );
        },
      ),
    );
  }
}