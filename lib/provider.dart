import 'package:flutter/material.dart';

class providertugas extends ChangeNotifier {
  List<String> _item = [
    "Tugas M01",
    "Tugas M02",
    "Tugas M03",
  ];

  List<String> get item => _item;

  set setitem(val) {
    _item = val;
    ChangeNotifier();
  }

  void additem() {
    _item.add("Tugas M0" + (_item.length + 1).toString());
    print("success");
    ChangeNotifier();
  }
}
