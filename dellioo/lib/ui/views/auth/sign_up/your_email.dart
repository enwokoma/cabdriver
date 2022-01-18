import 'package:dellioo/app_utils/styles/colors.dart';
import 'package:dellioo/app_utils/styles/strings.dart';
import 'package:dellioo/app_utils/styles/texts.dart';
import 'package:dellioo/app_utils/widgets/buttons/action_button.dart';
import 'package:dellioo/app_utils/widgets/textfields/app_text_field.dart';
import 'package:dellioo/ui/base/base_view.dart';
import 'package:dellioo/ui/views/auth/sign_up/view_model.dart';
import 'package:dellioo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class YourEmailScreen extends StatelessWidget {
  const YourEmailScreen({Key? key}) : super(key: key);

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
                        children:  [
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: dlColorPrimary400,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.dlWhatIsYourEmail,
                            style: dlHeadLineTextOne,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 6,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.dlReceiptsAndRewards,
                            style: dlBodyTextOne,
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      AppTextField(
                        focusNode: model!.focusNode,
                        borderColor: model.borderColor,
                        hintText: 'Email Address',
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),

                  Visibility(
                    visible: !isKeyboardVisible,
                    child: const Positioned(
                        bottom: 44,
                        right: 0,
                        left: 0,
                        child: ActionButton(
                          color: dlColorPrimary400,
                          onPressed: null,
                          text: 'Continue',
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