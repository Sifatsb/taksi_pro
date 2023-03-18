import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../configure/app_colors.dart';
import '../configure/app_widgets.dart';
import '../controller/api_controller.dart';
import '../drawer/drawer_page.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {


  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Obx(
            () => internetController.internet.isTrue
            ? Scaffold(
              appBar: AppBar(),
              drawer: const DrawerPage(),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [

                  Center(child: Text('DashBoard', style: AppStyle.title1,))

                ],
              ),
            )
            : AppWidgets().noInternet(),
      ),
    );
  }


}
