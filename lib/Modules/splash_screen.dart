import 'package:flutter/material.dart';
import 'package:truth_detector_app/Modules/welcome_screen.dart';
import 'package:truth_detector_app/Shared/Components/components.dart';


class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  AnimationController _controller ;
  Animation <double> _animation;
  @override
  void initState()
  {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.repeat();

    Future.delayed(Duration(seconds:3)).then((value) {
      navigateTo(context,WelcomeScreen());
    });

    super.initState();
  }
  @override
  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            )
        ),
        child: ScaleTransition(
          scale: _animation ,
          child: Center(
            child: Image.asset(
              'assets/images/appLogp.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ),
      ),
    );
  }
}