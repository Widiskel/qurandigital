// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qurandigital/app/pallete/color_pallete.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qurandigital/app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  final box = GetStorage();
  runApp(GetMaterialApp(
    theme: box.read("appDark") == null ? appLight : appDark,
    // theme: appLight,
    title: "Al-Quran Digital",
    initialRoute: Routes.LANDING_PAGE,
    getPages: AppPages.routes,
  ));
}
