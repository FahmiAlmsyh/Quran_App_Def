import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran_app/models/ayah_model.dart';
import 'package:quran_app/models/surah_model.dart';
import 'package:http/http.dart' as http;

class QuranRepository {
  Future<List<Surah>> getListSurah() async {
    String data = await rootBundle.loadString('assets/data/list-surah.json');
    return surahFromJson(data);
  }

  Future<AyahModel> getListAyah(String id_surah) async {
    // var response = await Dio().get("https://equran.id/api/surat/$id_surah");

    String url = "https://equran.id/api/surat/$id_surah";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return AyahModel.fromJson(body);
    }
    throw Exception("Error");
  }
}
