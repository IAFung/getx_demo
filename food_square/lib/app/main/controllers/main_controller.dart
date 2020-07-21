import 'package:get/get.dart';

class MainController extends GetxController {
  final _currentIndex = 0.obs;
  set currentIndex(value) => this._currentIndex.value = value;
  get currentIndex => this._currentIndex.value;

  changeTab(int index) {
    this.currentIndex = index;
  }

  onTabTapped(int index) {
    this.currentIndex = index;
  }
}
