// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, prefer_is_empty

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qurandigital/app/pallete/color_pallete.dart';
import 'package:qurandigital/model/detail_surah.dart' as detail;
import '../controllers/detail_juz_controller.dart';

class DetailJuzView extends GetView<DetailJuzController> {
  const DetailJuzView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> dataMapPerJuz = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("Juz ${dataMapPerJuz["juz"]}"),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: (dataMapPerJuz["verses"] as List).length,
            itemBuilder: (context, index) {
              if ((dataMapPerJuz["verses"] as List).length == 0) {
                return Center(
                  child: Text("Tidak ada data."),
                );
              }
              Map<String, dynamic> ayat = dataMapPerJuz["verses"][index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: appBluePurpleDark.withOpacity(0.3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/img/octago.png"),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                        "${(ayat['ayat'] as detail.Verse).number?.inSurah}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ),
                                Text(
                                  "${ayat['surah']}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.book_online_outlined)),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.play_arrow)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      " ${(ayat['ayat'] as detail.Verse).text?.arab} ",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      " ${(ayat['ayat'] as detail.Verse).text?.transliteration?.en} ",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      " ${(ayat['ayat'] as detail.Verse).translation?.id} ",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              );
            }));
  }
}
