import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TemaProvider extends ChangeNotifier {
  ThemeMode _TemaMode = ThemeMode.light;
  ThemeMode get TemaMode => _TemaMode;
  bool get ModeGelap => _TemaMode == ThemeMode.dark;

  static String kunci = "kunci";

  TemaProvider() {
    loadtema();
  }

  void loadtema() async{
    final koneksi = await SharedPreferences.getInstance();
    final gelap = koneksi.getBool(kunci) ?? false;

    _TemaMode = gelap ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

// await tidak bisa dijalankan kalo tidak ada asynchronousnya
  void gantitema(bool aktif) async{
    _TemaMode = aktif ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    final koneksi = await SharedPreferences.getInstance();
    koneksi.setBool(kunci, aktif);
  }
}
