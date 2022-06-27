// ignore_for_file: unnecessary_brace_in_string_interps, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qurandigital/app/pallete/color_pallete.dart';
import 'package:qurandigital/app/routes/app_pages.dart';
import 'package:qurandigital/model/detail_surah.dart' as detail;

import 'package:qurandigital/model/surah.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (Get.isDarkMode) {
      controller.isDark.value = true;
    }
    return Scaffold(
      appBar: AppBar(
        elevation: Get.isDarkMode ? 0 : 4,
        title: Text('AL-Quran Digital'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(Routes.SEARCH),
              icon: Icon(Icons.search))
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Assalamualaikum",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient:
                        LinearGradient(colors: [appPurple, appPurpleDark])),
                child: Material(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Get.toNamed(Routes.LAST_READ),
                    borderRadius: BorderRadius.circular(40),
                    child: SizedBox(
                      height: 120,
                      width: Get.width,
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            bottom: -40,
                            child: Opacity(
                              opacity: 0.5,
                              child: SizedBox(
                                  width: 200,
                                  height: 200,
                                  child: Image.asset(
                                    'assets/img/quran.png',
                                    fit: BoxFit.contain,
                                  )),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(Icons.menu_book_rounded,
                                      color: appSoftWhite),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "last read",
                                    style: TextStyle(
                                        color: appSoftWhite, fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Surat",
                                    style: TextStyle(
                                        color: appSoftWhite, fontSize: 14),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Ayat",
                                    style: TextStyle(
                                        color: appSoftWhite, fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              TabBar(
                tabs: [
                  Tab(
                    text: "Surah",
                  ),
                  Tab(
                    text: "Juz",
                  ),
                  Tab(
                    text: "BookMark",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    FutureBuilder<List<Surah>>(
                        future: controller.getAllSurah(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (!snapshot.hasData) {
                            return Center(
                              child: Text("Tidak Ada Data"),
                            );
                          }
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              Surah surah = snapshot.data![index];
                              return ListTile(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_SURAH,
                                      arguments: surah);
                                },
                                leading: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/img/octago.png"))),
                                  child: Center(
                                    child: Text("${surah.number}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ),
                                title: Text(
                                  "Surah ${surah.name?.transliteration?.id ?? 'Error...'} ",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                    "${surah.numberOfVerses} Ayat Diturunkan di ${surah.revelation?.id ?? 'Error...'}",
                                    style: TextStyle(fontSize: 10)),
                                trailing: Text(
                                  "${surah.name?.short}",
                                ),
                              );
                            },
                          );
                        }),
                    FutureBuilder<List<Map<String, dynamic>>>(
                        future: controller.getAllJuz(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (!snapshot.hasData) {
                            return Center(
                              child: Text("Tidak Ada Data"),
                            );
                          }
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> dataMapPerJuz =
                                  snapshot.data![index];
                              return ListTile(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_JUZ,
                                      arguments: dataMapPerJuz);
                                },
                                leading: Container(
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
                                      "${index + 1}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                isThreeLine: true,
                                title: Text(
                                  "Juz ${index + 1} ",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Mulai dari ${dataMapPerJuz['start']['surah']} Ayat ke ${(dataMapPerJuz['start']['ayat'] as detail.Verse).number?.inSurah}",
                                        style: TextStyle(fontSize: 10)),
                                    Text(
                                        "Sampai ${dataMapPerJuz['end']['surah']} Ayat ke ${(dataMapPerJuz['end']['ayat'] as detail.Verse).number?.inSurah}",
                                        style: TextStyle(fontSize: 10)),
                                  ],
                                ),
                              );
                            },
                          );
                        }),
                    Center(
                      child: Text("Tab3"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (() => controller.changeThemeMode()),
          child: Obx(
            () => Icon(
              Icons.color_lens,
              color: controller.isDark.isTrue ? appPurpleDark : appSoftWhite,
            ),
          )),
    );
  }
}
