import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starbucks_redesign/view/home/view/home_view.dart';

class ControlViewmodel extends GetxController {
  Widget _currentPage = HomeView();
  int _currentIndex = 0;

  Widget get getCurrentPage => _currentPage;
  int get getCurrentIndex => _currentIndex;

  changeCurrentPage(int index) {
    _currentIndex = index;
    switch (index) {
      case 0:
        _currentPage = const HomeView();
        break;
    }
    update();
  }
}
