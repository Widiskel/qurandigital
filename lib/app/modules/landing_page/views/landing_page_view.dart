// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:qurandigital/app/pallete/color_pallete.dart';
import 'package:qurandigital/app/routes/app_pages.dart';

import '../controllers/landing_page_controller.dart';

class LandingPageView extends GetView<LandingPageController> {
  const LandingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //another

          //main
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Al-Quran Digital",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Bacalah Kapanpun Dan Dimanapun",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: SizedBox(
                      width: 250,
                      height: 250,
                      child: Lottie.asset("assets/lottie/quran_dark.json"),
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () => Get.offAllNamed(Routes.HOME),
                    child: Text(
                      "Getting Started",
                      style: TextStyle(
                        color: Get.isDarkMode ? appSoftWhite : appSoftWhite,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary:
                            Get.isDarkMode ? appSoftPurpleDark : appOldBlueDark,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
