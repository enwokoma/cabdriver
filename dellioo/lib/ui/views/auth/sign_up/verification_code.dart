import 'package:dellioo/app_utils/styles/colors.dart';
import 'package:dellioo/app_utils/styles/strings.dart';
import 'package:dellioo/app_utils/styles/texts.dart';
import 'package:dellioo/app_utils/widgets/buttons/action_button.dart';
import 'package:dellioo/app_utils/widgets/modals/app_modal.dart';
import 'package:dellioo/app_utils/widgets/textfields/app_text_field.dart';
import 'package:dellioo/ui/base/base_view.dart';
import 'package:dellioo/ui/views/auth/modals/resend_code_modal.dart';
import 'package:dellioo/ui/views/auth/sign_up/view_model.dart';
import 'package:dellioo/ui/views/auth/sign_up/your_name.dart';
import 'package:dellioo/utils/constants.dart';
import 'package:dellioo/utils/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({Key? key}) : super(key: key);

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
                            AppStrings.dlVerificationCode,
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
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                text: AppStrings.dlEnterVerificationCode,
                                style: dlBodyTextOne,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '(+234)07081453636',
                                    style: GoogleFonts.krub(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.231,
                                    ),
                                  ),
                                ]),
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      AppTextField(
                        focusNode: model!.focusNode,
                        borderColor: model.borderColor,
                        hintText: 'Verification Code',
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => AppModal(
                                bigText: AppStrings.dlResendVerificationCode,
                                mainButtonText: AppStrings.dlResend,
                                highLightButtonText:AppStrings.dlCancel,
                                subText: 'Verify your phone number',
                                highLightButtonClicked: (){
                                  Navigator.pop(context);
                                },
                                height: getSize(context).height * .4,
                                mainButtonClicked: (){
                                  Navigator.pop(context);
                                }
                            ),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Resend Code in 0:14',
                              style: TextStyle(
                                color: dlColorBlackGrey3
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  Visibility(
                    visible: !isKeyboardVisible,
                    child:  Positioned(
                        bottom: 44,
                        right: 0,
                        left: 0,
                        child: ActionButton(
                          color: dlColorPrimary400,
                          onPressed: (){
                            navigate(context, const YourNameScreen());
                          },
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
