import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../configure/app_colors.dart';
import '../configure/app_widgets.dart';
import '../controller/api_controller.dart';
import '../dashboard/dashboard.dart';

class OtpMatchScreen extends StatefulWidget {
  var phone;
  OtpMatchScreen({Key? key, required this.phone}) : super(key: key);

  @override
  State<OtpMatchScreen> createState() => _OtpMatchScreenState();
}

class _OtpMatchScreenState extends State<OtpMatchScreen> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  String currentText = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Obx(() => Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: h*0.08,),
            const Text('\nVerify your phone number',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: '\nWe Send OTP: '),
                  TextSpan(
                    text: '${widget.phone}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                ],
              ),
            ),

            const Text('\nEnter your otp code here.\n\n',
              style: TextStyle(
                  fontWeight: FontWeight.w500
              ),
            ),

            PinCodeTextField(
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              cursorColor: Colors.black,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.circle,
                fieldHeight: 50,
                fieldWidth: 50,
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white,
                selectedColor: AppColors.primaryColor,
                inactiveColor: AppColors.primaryColor,
                activeColor: Colors.grey,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              errorAnimationController: errorController,
              controller: textEditingController,
              onCompleted: (v) {
                if(currentText != ''){
                  loginController.press.value = true;
                  matchOtp(
                      context,
                      registrationInfoController.phone.toString(),
                      currentText,
                      registrationInfoController.type.toString(),
                      registrationInfoController.from.toString());
                } else {
                  AppWidgets().wrongSnackBar(context, 'Please Enter an OTP');
                }
              },
              onChanged: (value) {
                setState(() {
                  currentText = value;
                });
              },
              beforeTextPaste: (text) {
                return true;
              }, appContext: context,
            ),

            const Text("\nDidn't you receive any code? Wait!\n",
              style: TextStyle(fontSize: 15,
                  letterSpacing: 1),),

            CircularCountDownTimer(
              duration: 180,
              initialDuration: 0,
              controller: CountDownController(),
              width: 80,
              height: 80,
              ringColor: Colors.grey[300]!,
              ringGradient: null,
              fillColor: AppColors.primaryColor.withOpacity(0.4),
              fillGradient: null,
              backgroundColor: AppColors.primaryColor,
              backgroundGradient: null,
              strokeWidth: 20.0,
              strokeCap: StrokeCap.round,
              textStyle: const TextStyle(
                  fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
              textFormat: CountdownTextFormat.S,
              isReverse: true,
              isReverseAnimation: true,
              isTimerTextShown: true,
              autoStart: true,
              onStart: () {
                debugPrint('Countdown Started');
              },
              onComplete: () {
                debugPrint('Countdown Ended');
              },
            ),

            /// Resend OTP Button
            SizedBox(height: h*0.15,),
            GestureDetector(
              onTap: (){
                loginController.press.value = true;
                sendOtpRequest(context,
                    phone: registrationInfoController.phone.toString(),
                    type: registrationInfoController.type.toString(),
                    from: registrationInfoController.from.toString());
              },
              child: const Text("\nResend OTP\n",
                style: TextStyle(fontSize: 15,
                    letterSpacing: 1),),
            ),
          ],
        ),
      ),
      bottomNavigationBar: loginController.press.isFalse ? AppWidgets().submitButton(context, text: 'Verify', press: (){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  const DashboardScreen()), (route) => false);
        // if(currentText != ''){
        //   loginController.press.value = true;
        //   matchOtp(
        //       context,
        //       registrationInfoController.phone.toString(),
        //       currentText,
        //       registrationInfoController.type.toString(),
        //       registrationInfoController.from.toString());
        // } else {
        //   AppWidgets().wrongSnackBar(context, 'Please Enter an OTP');
        // }
      }) : Padding(
        padding: EdgeInsets.symmetric(vertical: h*0.03, horizontal: w*0.45),
        child: const CircularProgressIndicator(),
      ),
    ));
  }
}