import 'package:cab_driver/app_widgets/brand_divider.dart';
import 'package:cab_driver/app_widgets/predition_tile.dart';
import 'package:cab_driver/data_providers/app_data.dart';
import 'package:cab_driver/helpers/request_helper.dart';
import 'package:cab_driver/models/prediction_model.dart';
import 'package:cab_driver/utils/brand_colors.dart';
import 'package:cab_driver/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  var pickUpController = TextEditingController();
  var destinationController = TextEditingController();

  var focusDestination = FocusNode();

  bool focused = false;

  void setFocus(){
    if(!focused){
      FocusScope.of(context).requestFocus(focusDestination);
      focused = true;
    }
  }

  List<Prediction> destinationPredictionList = [];
  void searchPlace(String placeName) async{
    if(placeName.length > 1){
      String url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$mapApiKeyAndroid&sessiontoken=123254251&components=country:ng';
      var response = await RequestHelper.getRequestAll(url);

      if(response == 'Failed'){
        return;
      }

      if(response['status'] == 'OK'){
        var predictionJson = response['predictions'];
        var thisList = (predictionJson as List).map((e) => Prediction.fromJson(e)).toList();
        setState(() {
          destinationPredictionList = thisList;
        });

      }
    }else{
      destinationPredictionList = [];
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      FocusScope.of(context).requestFocus(focusDestination);
    });

  }
  @override
  Widget build(BuildContext context) {

    if(context.watch<AppData>().pickUpAddress != null){
      pickUpController.text = context.watch<AppData>().pickUpAddress!.placeName!;
      // destinationController.text = context.watch<AppData>().pickUpAddress!.!;
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 210,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5.0,
                  spreadRadius: 0.5,
                  offset: Offset(
                    0.7,
                    0.7
                  )
                )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 48, right: 24, bottom: 20),
              child: Column(
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back)),
                      Center(
                        child: Text('Set Destination', style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Brand-Bold'
                        ),)
                      )
                    ],
                  ),
                  SizedBox(height: 18,),

                  Row(
                    children: [
                      Image.asset('assets/images/pickicon.png', height: 16, width: 16,),

                      SizedBox(width: 18,),

                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: BrandColors.colorLightGrayFair,
                            borderRadius: BorderRadius.circular(4)
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: TextField(
                              controller: pickUpController,
                              decoration: InputDecoration(
                                hintText: 'PickUp location',
                                fillColor: BrandColors.colorLightGrayFair,
                                filled: true,
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.only(left: 10, top: 8, bottom: 8)
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 10,),

                  Row(
                    children: [
                      Image.asset('assets/images/desticon.png', height: 16, width: 16,),

                      SizedBox(width: 18,),

                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: BrandColors.colorLightGrayFair,
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: TextField(
                              focusNode: focusDestination,
                              controller: destinationController,
                              onChanged: (String str){
                                searchPlace(str);
                              },
                              decoration: InputDecoration(
                                  hintText: 'Where to?',
                                  fillColor: BrandColors.colorLightGrayFair,
                                  filled: true,
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(left: 10, top: 8, bottom: 8)
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),

          (destinationPredictionList.isNotEmpty) ?
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListView.separated(
              padding: const EdgeInsets.all(8.0),
                itemBuilder: (context, index){
                  return PreditionTile(
                    prediction: destinationPredictionList[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const BrandDivider(),
                itemCount: destinationPredictionList.length,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),),
          )
              :
              Container()
        ],
      ),
    );
  }
}