// ignore_for_file: unused_local_variable, avoid_print, unused_import, unused_element

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qurandigital/app/pallete/color_pallete.dart';
import 'package:qurandigital/app/routes/app_pages.dart';
import 'package:qurandigital/model/juz.dart';

Future<void> main() async {
  // //Surah
  // Uri url = Uri.parse("https://api.quran.sutanlab.id/surah");
  // var res = await http.get(url);
  // List data = (json.decode(res.body) as Map<String, dynamic>)["data"];
  // Surah surahAnnas = Surah.fromJson(data[113]);

  // //detail surah
  // Uri urlAnnas =
  //     Uri.parse("https://api.quran.sutanlab.id/surah/${surahAnnas.number}");
  // var resAnnas = await http.get(urlAnnas);
  // Map<String, dynamic> dataAnnas =
  //     (json.decode(resAnnas.body) as Map<String, dynamic>)["data"];
  // DetailSurah annas = DetailSurah.fromJson(dataAnnas);

  //ayat
  // Uri urlAyat = Uri.parse("https://api.quran.sutanlab.id/surah/108/1");
  // var resAyat = await http.get(urlAyat);
  // Map<String, dynamic> data = json.decode(resAyat.body)["data"];
  // Ayat ayat = Ayat.fromJson(data);
  // Future<List<Juz>> getAllJuz() async {
  //   List<Juz> allJuz = [];
  //   // for (int i = 1; i <= 30; i++) {
  //   Uri url = Uri.parse("https://api.quran.sutanlab.id/juz/5");
  //   var res = await http.get(url);
  //   Map<String, dynamic> data =
  //       (json.decode(res.body) as Map<String, dynamic>)['data'];
  //   print(Juz.fromJson(data));

  //   // }
  //   return allJuz;
  // }
}
