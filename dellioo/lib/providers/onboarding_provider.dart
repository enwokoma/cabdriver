import 'package:flutter/foundation.dart';

class OnboardingProvider extends ChangeNotifier{

  bool _isLastPage = false;
  bool get isLastPage => _isLastPage;
  set isLastPage(bool val){
    _isLastPage = val;
    notifyListeners();
  }
}