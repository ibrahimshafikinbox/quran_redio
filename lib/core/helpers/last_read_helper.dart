import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

class LastReadInfo {
  final int surahId;
  final String surahName;
  final int ayahNumberInSurah;
  final int pageIndex;

  LastReadInfo({
    required this.surahId,
    required this.surahName,
    required this.ayahNumberInSurah,
    required this.pageIndex,
  });

  Map<String, dynamic> toJson() => {
    'surahId': surahId,
    'surahName': surahName,
    'ayahNumberInSurah': ayahNumberInSurah,
    'pageIndex': pageIndex,
  };

  factory LastReadInfo.fromJson(Map<String, dynamic> json) => LastReadInfo(
    surahId: json['surahId'] as int,
    surahName: json['surahName'] as String,
    ayahNumberInSurah: json['ayahNumberInSurah'] as int,
    pageIndex: json['pageIndex'] as int? ?? 0,
  );
}

class LastReadHelper {
  LastReadHelper._();

  static Future<void> saveLastRead(LastReadInfo info) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.lastReadAyahKey, jsonEncode(info.toJson()));
  }

  static Future<LastReadInfo?> getLastRead() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.reload();

    final data = prefs.getString(AppConstants.lastReadAyahKey);
    if (data == null) return null;
    try {
      return LastReadInfo.fromJson(jsonDecode(data));
    } catch (_) {
      return null;
    }
  }

  static Future<void> clearLastRead() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.lastReadAyahKey);
  }
}
