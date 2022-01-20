import 'package:dellioo/app_utils/styles/colors.dart';
import 'package:dellioo/app_utils/styles/strings.dart';
import 'package:dellioo/app_utils/styles/texts.dart';
import 'package:dellioo/app_utils/widgets/buttons/action_button.dart';
import 'package:dellioo/app_utils/widgets/buttons/highlight_action_button.dart';
import 'package:dellioo/app_utils/widgets/modals/app_modal.dart';
import 'package:dellioo/app_utils/widgets/top_bar.dart';
import 'package:dellioo/ui/base/base_view.dart';
import 'package:dellioo/ui/views/auth/sign_up/creating_account.dart';
import 'package:dellioo/ui/views/auth/sign_up/view_model.dart';
import 'package:dellioo/ui/views/auth/sign_up/widgets/sub_header.dart';
import 'package:dellioo/ui/views/auth/sign_up/widgets/title_header.dart';
import 'package:dellioo/utils/constants.dart';
import 'package:dellioo/utils/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePhotoScreen extends StatelessWidget {
  const ProfilePhotoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
      model: SignUpViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, _) => Scaffold(
        body: Container(
          width: getSize(context!).width,
          height: getSize(context).height,
          padding: const EdgeInsets.only(top: 60, right: 18, left: 18),
          child: Stack(
            children: [
              Column(
                children: [

                  AppTopBar(
                    backButtonPressed: (){
                      Navigator.pop(context);
                    },
                    shouldShowTrailing: true,
                    trailingPressed: null,
                    trailingText: 'Later',
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  TitleHeader(
                      title:AppStrings.dlSetYourProfilePicture
                  ),

                  const SizedBox(
                    height: 6,
                  ),

                  SubHeader(
                    subHeaderText: AppStrings.profilePictureSubHeader,
                  ),

                ],
              ),

              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/images/vector/profile_placeholder.svg',
                  width: 186,
                  height: 186,
                ),
              ),

              Positioned(
                  right: 0,
                  left: 0,
                  bottom: 140,
                  child: HighLightActionButton(
                    onPressed: (){
                      navigate(context, const CreatingAccountScreen());
                    },
                    actionText: 'Later',
                  )
              ),

               Positioned(
                  bottom: 44,
                  right: 0,
                  left: 0,
                  child: ActionButton(
                    color: dlColorPrimary400,
                    onPressed: (){
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => AppModal(
                            bigText: AppStrings.dlAllowCameraAccess,
                            mainButtonText: AppStrings.dlTurnOn,
                            highLightButtonText:AppStrings.dlCancel,
                            subText: AppStrings.dlUseCameraToTakePicture,
                            highLightButtonClicked: (){
                              Navigator.pop(context);
                            },
                            height: getSize(context).height * .34,
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
                    text: 'Take Picture',
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
