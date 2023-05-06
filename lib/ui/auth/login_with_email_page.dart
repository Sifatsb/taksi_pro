import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taksi_pro/configure/app_colors.dart';
import 'package:taksi_pro/configure/app_widgets.dart';

class LoginWithEmailScreen extends StatefulWidget {
  const LoginWithEmailScreen({Key? key}) : super(key: key);

  @override
  State<LoginWithEmailScreen> createState() => _LoginWithEmailScreenState();
}

class _LoginWithEmailScreenState extends State<LoginWithEmailScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppWidgets().appBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(height: h*0.2,),
              const Text('Create an account', style: AppStyle.title2,),
              SizedBox(height: h*0.1,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: AppWidgets().customTextField(context,
                    validator: (String? value) {
                      return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                    },
                    autofillHints: AutofillHints.name, label: 'E-mail', autoFocus: true),
              ),

              SizedBox(height: h*0.03,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: AppWidgets().button(
                  context,
                  text: 'Next',
                  height: h * 0.07,
                  width: w * 0.87,
                  radius: 10.0,
                  color: AppColors.orangeColor,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: AppColors.textColor,
                    ),
                  ),
                  press: () {

                  },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
