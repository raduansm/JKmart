import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jkmart/controllers/home_controller.dart';
import 'package:jkmart/core/widgets/appdrawer.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: controller.scaffoldKey,
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          iconSize: 20,
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () => controller.openDrawer(),
          color: Colors.black,
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 100),
          child: Text(
            'Home',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
