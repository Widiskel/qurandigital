// ignore_for_file: unused_local_variable, unnecessary_null_comparison, unused_import

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:qurandigital/app/pallete/color_pallete.dart';
import 'package:qurandigital/model/detail_surah.dart';
import 'dart:convert';

import 'package:qurandigital/model/surah.dart';

class HomeController extends GetxController {
  RxBool isDark = false.obs;
  List<Surah> allSurah = [];
  void changeThemeMode() async {
    Get.isDarkMode ? Get.changeTheme(appLight) : Get.changeTheme(appDark);
    isDark.toggle();

    // final box = GetStorage();
    // if (Get.isDarkMode) {
    //   box.remove("appDark");
    // } else {
    //   box.write("appDark", true);
    // }
  }

  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse("https://api.quran.sutanlab.id/surah");
    var res = await http.get(url);
    List data = (json.decode(res.body) as Map<String, dynamic>)["data"];

    if (data == null) {
      return [];
    } else {
      allSurah = data.map((e) => Surah.fromJson(e)).toList();
      return allSurah;
    }
  }

  Future<List<Map<String, dynamic>>> getAllJuz() async {
    int juz = 1;
    List<Map<String, dynamic>> penampungAyat = [];
    List<Map<String, dynamic>> allJuz = [];

    for (var i = 1; i <= 114; i++) {
      Uri url = Uri.parse("https://api.quran.sutanlab.id/surah/$i");
      var res = await http.get(url);
      Map<String, dynamic> rawData = json.decode(res.body)["data"];
      DetailSurah data = DetailSurah.fromJson(rawData);

      if (data.verses != null) {
        for (var ayat in data.verses!) {
          if (ayat.meta?.juz == juz) {
            penampungAyat.add({
              "surah": data.name?.transliteration?.id ?? '',
              "ayat": ayat,
            });
          } else {
            allJuz.add({
              "juz": juz,
              "start": penampungAyat[0],
              "end": penampungAyat[penampungAyat.length - 1],
              "verses": penampungAyat,
            });
            juz++;
            penampungAyat = [];
            penampungAyat.add({
              "surah": data.name?.transliteration?.id ?? '',
              "ayat": ayat,
            });
          }
        }
      }
    }
    allJuz.add({
      "juz": juz,
      "start": penampungAyat[0],
      "end": penampungAyat[penampungAyat.length - 1],
      "verses": penampungAyat,
    });

    return allJuz;
  }
}
