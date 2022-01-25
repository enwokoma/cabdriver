import 'package:dellioo/app_utils/styles/colors.dart';
import 'package:dellioo/app_utils/styles/strings.dart';
import 'package:dellioo/app_utils/styles/texts.dart';
import 'package:dellioo/app_utils/widgets/textfields/app_text_field.dart';
import 'package:dellioo/ui/base/base_view.dart';
import 'package:dellioo/ui/views/home/view_model.dart';
import 'package:dellioo/ui/views/home/widgets/favourite_destination_widget.dart';
import 'package:dellioo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      model: HomeViewModel(),
      onModelReady: (model) => model.init(),
      onDispose: (model) => model.dispose(),
      builder: (context, model, _) => Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              padding: EdgeInsets.only(bottom: model!.mapPaddingButtom),
              mapType: MapType.normal,
              myLocationEnabled: true,
              initialCameraPosition: model.kGooglePlex,
              myLocationButtonEnabled: true,
              polylines: model.polyLines,
              markers: model.markers,
              circles: model.circles,
              onMapCreated: (GoogleMapController controller) {
                model.onMapCreated(controller, context!);
              },
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: getSize(context!).height * .36,
                padding: const EdgeInsets.all(18),
                width: getSize(context).width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: dlColorWhite,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              text: 'Good morning, ',
                              style: dlTextFieldTextOne,
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Matthew',
                                  style: dlTitleTextFive,
                                ),
                              ]),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20,),

                    AppTextField(
                      hintText: AppStrings.dlWhereTo,
                      prefixIcon: SizedBox(
                        width: 10,
                        height: 10,
                        child: SvgPicture.asset(
                            'assets/images/vector/search_icon.svg',
                        ),
                      ),
                    ),

                    const SizedBox(height: 20,),

                    Row(
                      children: [
                        Text(
                            AppStrings.dlFavourite,
                          style: dlSubBodyTextOne,
                        ),
                      ],
                    ),

                    const SizedBox(height: 20,),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          FavouriteDestinationsWidget(
                            icon: const Icon(Icons.add, color: dlColorBlackGrey2,),
                            text: AppStrings.dlAddNew,
                          ),

                          FavouriteDestinationsWidget(
                            icon: const Icon(Icons.add, color: dlColorBlackGrey2,),
                            text: AppStrings.dlHome,
                          ),

                          FavouriteDestinationsWidget(
                            icon: const Icon(Icons.add, color: dlColorBlackGrey2,),
                            text: AppStrings.dlWork,
                          ),

                          FavouriteDestinationsWidget(
                            icon: const Icon(Icons.add, color: dlColorBlackGrey2,),
                            text: AppStrings.dlAddNew,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


