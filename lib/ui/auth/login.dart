// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taksi_pro/ui/auth/registration.dart';

import '../../configure/app_colors.dart';
import '../../configure/app_widgets.dart';
import '../../controller/api_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      internetController.internetConnection();
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Obx(
      () => internetController.internet.isTrue
          ? Scaffold(
              backgroundColor: AppColors.backgroundColor,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(height: h*0.35),
                    const Text('Sign in', style: AppStyle.title1,),
                    SizedBox(height: h*0.04),

                    /// Email Address Button
                    SizedBox(
                      height: h*0.065,
                      width: w*0.8,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade100
                          ),
                          onPressed: (){

                          }, child: Text('Sign in with e-mail', style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          color: AppColors.textColor,
                        ),
                      ),)),
                    ),

                    SizedBox(height: h*0.025),
                    Text('or connect with', style: TextStyle(color: Colors.grey.shade700),),
                    SizedBox(height: h*0.03),

                    /// Facebook and Google Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Facebook Button
                        Container(
                          height: h * 0.086,
                          width: w * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: Icon(
                                Icons.facebook_outlined,
                                size: h * 0.053,
                              )),
                        ),
                        SizedBox(width: w*0.07,),

                        /// Google Button
                        SizedBox(
                            height: h * 0.086,
                            width: w * 0.2,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0)
                                  ),
                                  side: BorderSide(
                                      color: Colors.grey.shade400,
                                      width: 1.5
                                  )
                              ),
                              onPressed: (){}, child: Image.asset('assets/images/google_icon.png', height: 40, width: 40,),))

                      ],
                    ),

                    SizedBox(height: h*0.18),
                    /// Not Account
                    GestureDetector(
                      onTap: () {
                        Get.off(() => const RegistrationScreen(),
                            duration: const Duration(milliseconds: 300),
                            transition: Transition.upToDown);
                      },
                      child: RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Not account yet?',
                              style: TextStyle(color: AppColors.greyColor, fontSize: 28, fontWeight: FontWeight.bold),),
                            TextSpan(
                              text: '  Sign up here',
                              style: TextStyle(color: AppColors.blueColor, fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        textScaleFactor: 0.5,
                      ),
                    ),

                  ],
                ),
              ),
            )
          : AppWidgets().noInternet(),
    );
  }
}
