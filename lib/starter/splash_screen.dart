import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../configure/app_colors.dart';
import '../controller/api_controller.dart';
import '../ui/auth/registration.dart';
import 'entry_screen.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({Key? key}) : super(key: key);

  @override
  AnimatedSplashScreenState createState() => AnimatedSplashScreenState();
}

class AnimatedSplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  SharedPreferences? prefs;
  var token, phone;

  startTime() async {
    var duration = const Duration(milliseconds: 1800);
    return Timer(duration, _loadUserInfo);
  }

  _loadUserInfo() async {
    loginController.token.value = '$token';
    if (token != "" && token != 'null' && token != null) {
      login(context, phone: phone, from: 'splash');
    } else {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const RegistrationScreen()), (route) => false);
      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const StarterScreen()), (route) => false);
    }
  }

  sharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    token = (prefs!.getString('token') ?? "");
    phone = (prefs!.getString('phone') ?? "");
  }


  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween<double>(
      begin: 30,
      end: 40,
    ).animate(animationController);
    // animation = CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => setState(() {}));
    animationController.forward();
    startTime();
    sharedPreferences();


  }

  @override
  dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: AppColors.secondaryColor,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(AppStyle.splashTitle, style: AppStyle.splashTitleStyle,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
