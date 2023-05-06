import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../configure/app_colors.dart';
import '../../configure/app_widgets.dart';
import '../../controller/api_controller.dart';
import '../../controller/image_controller/image_get.dart';
import 'login.dart';
import 'login_with_email_page.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  var nameController      = TextEditingController();
  var phoneController     = TextEditingController();
  var passwordController  = TextEditingController();

  bool mIsLoading = false;
  bool isChecked = false;
  bool hidePassword = true;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final imageGet = Provider.of<ImageGet>(context, listen: true);
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Obx(
      () => internetController.internet.isTrue
          ? Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  height: h,
                  width: w,
                  decoration: const BoxDecoration(color: AppColors.backgroundColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      /// Upper Design
                      ClipPath(
                        clipper: ClippingClass(),
                        child: Container(
                          width: w,
                          height: h*0.4,
                          decoration: const BoxDecoration(
                            color: AppColors.secondaryBackgroundColor,
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(top: 55, right: 15.0),
                                    child: Text('Skip', style: AppStyle.bodyText2),
                                  ),
                                ],
                              ),
                              SizedBox(height: h*0.115),
                              const Text(AppStyle.splashTitle, style: AppStyle.splashTitleStyle,)
                            ],
                          ),
                        ),
                      ),

                      /// Lower Design
                      SizedBox(height: h*0.08),
                      const Text('Get Started', style: AppStyle.title1,),
                      SizedBox(height: h*0.04),

                      /// Email Address Button
                      SizedBox(
                        height: h*0.065,
                        width: w*0.8,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade100,
                            elevation: 0.7
                          ),
                            onPressed: (){
                            debugPrint('changes applied');
                              Get.to(() => const LoginWithEmailScreen(),
                                  duration: const Duration(milliseconds: 300),
                                  transition: Transition.downToUp);
                            }, child: Text('Enter your e-mail address', style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            color: AppColors.textColor,
                          ),
                        ),)),
                      ),

                      SizedBox(height: h*0.025),
                      Text('or connect with', style: TextStyle(color: Colors.grey.shade700),),
                      SizedBox(height: h*0.03),

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
                                onPressed: () {
                                },
                                icon: Icon(
                                  Icons.facebook_outlined,
                                  size: h * 0.048,
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
                              onPressed: (){}, child: Image.asset('assets/images/google_icon.png', height: 32, width: 32,),))

                        ],
                      ),

                      SizedBox(height: h*0.03,),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
                          Get.off(() => const LoginScreen(),
                              duration: const Duration(milliseconds: 300),
                              transition: Transition.downToUp);
                        },
                        child: RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Already have an account?',
                                  style: TextStyle(color: AppColors.greyColor, fontSize: 28, fontWeight: FontWeight.bold),),
                              TextSpan(
                                text: '  Sign in here',
                                style: TextStyle(color: AppColors.blueColor, fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          textScaleFactor: 0.5,
                        ),
                      ),

                      SizedBox(
                        height: h * 0.05,
                      ),
                    ],
                  ),
                ),
              ),
            )
          : AppWidgets().noInternet(),
    );
  }
}


class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height-40);
    path.quadraticBezierTo(size.width / 4, size.height,
        size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}