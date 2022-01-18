import 'package:dellioo/app_utils/styles/colors.dart';
import 'package:dellioo/app_utils/styles/strings.dart';
import 'package:dellioo/app_utils/styles/texts.dart';
import 'package:dellioo/app_utils/widgets/buttons/action_button.dart';
import 'package:dellioo/app_utils/widgets/textfields/app_text_field.dart';
import 'package:dellioo/ui/base/base_view.dart';
import 'package:dellioo/ui/views/auth/sign_up/verification_code.dart';
import 'package:dellioo/ui/views/auth/sign_up/view_model.dart';
import 'package:dellioo/utils/constants.dart';
import 'package:dellioo/utils/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class EnterMobileNumber extends StatelessWidget {
  const EnterMobileNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
        model: SignUpViewModel(),
        onModelReady: (model) => model.init(),
        onDispose: (model) => model.dispose(),
        builder: (context, model, _) => Scaffold(
              body: KeyboardVisibilityBuilder(
                builder: (context, isKeyboardVisible) => Container(
                  width: getSize(context).width,
                  height: getSize(context).height,
                  padding: const EdgeInsets.only(top: 60, right: 18, left: 18),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.arrow_back,
                                color: dlColorPrimary400,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            AppStrings.dlEnterMobileNumber,
                            style: dlHeadLineTextOne,
                            textAlign: TextAlign.left,
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          AppTextField(
                            focusNode: model!.focusNode,
                            borderColor: model.borderColor,
                            hintText:  AppStrings.dlPhoneNumber,
                          )
                        ],
                      ),

                      Visibility(
                        visible: !isKeyboardVisible,
                        child: Positioned(
                            bottom: 44,
                            right: 0,
                            left: 0,
                            child: ActionButton(
                              color: dlColorPrimary400,
                              onPressed: (){
                                navigate(context, const VerificationCode());
                              },
                              text: 'Continue',
                            )
                        ),
                      ),

                      Visibility(
                        visible: !isKeyboardVisible,
                        child: Positioned(
                            bottom: 128,
                            right: 0,
                            left: 0,
                            child: Text(
                              AppStrings.dlMobileNumberInfoText,
                              style: dlSubBodyTextOne,
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}

