import 'package:dellioo/app_utils/styles/colors.dart';
import 'package:dellioo/ui/base/base_view_model.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends BaseViewModel{

  FocusNode focusNode = FocusNode();

  Color _borderColor = Colors.transparent;
  Color get borderColor => _borderColor;
  set borderColor(Color val) {
    _borderColor = val;
    notifyListeners();
  }

  init(){
    focusNode.addListener(onFocusChanged);
  }

  onFocusChanged(){
    if (focusNode.hasFocus) {
      borderColor = dlColorPrimary400;
    } else {
      borderColor = Colors.transparent;
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode.removeListener(onFocusChanged);
  }
}