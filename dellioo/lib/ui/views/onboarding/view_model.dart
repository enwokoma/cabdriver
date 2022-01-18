import 'package:dellioo/ui/base/base_view_model.dart';
import 'package:flutter/material.dart';

class OnboardingViewModel extends BaseViewModel{
  final PageController pageController = PageController();

  bool _isLastPage = false;
  bool get isLastPage => _isLastPage;
  set isLastPage(bool val){
    _isLastPage = val;
    notifyListeners();
  }

  void init(){

  }

  int _currentPage = 0;
  int get currentPage => _currentPage;
  set currentPage(int val) {
    _currentPage = val;
    notifyListeners();
  }


  void onPageChanged(int page){
    currentPage = page;
  }

  void nextPage(){
    pageController.animateToPage(pageController.page!.toInt() + 1,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn
    );
  }

  void previousPage(){
    pageController.animateToPage(pageController.page!.toInt() -1,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn
    );
  }
}