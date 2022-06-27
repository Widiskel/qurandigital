import 'package:get/get.dart';
import 'package:qurandigital/model/detail_surah.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailSurahController extends GetxController {
  Future<DetailSurah> getDetailSurah(String id) async {
    Uri url = Uri.parse("https://api.quran.sutanlab.id/surah/$id");
    var res = await http.get(url);
    Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)["data"];

    return DetailSurah.fromJson(data);
  }
}
