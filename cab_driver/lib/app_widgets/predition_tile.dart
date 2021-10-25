import 'package:cab_driver/app_widgets/progress_dialog.dart';
import 'package:cab_driver/data_providers/app_data.dart';
import 'package:cab_driver/helpers/request_helper.dart';
import 'package:cab_driver/models/address_model.dart';
import 'package:cab_driver/models/prediction_model.dart';
import 'package:cab_driver/utils/brand_colors.dart';
import 'package:cab_driver/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreditionTile extends StatelessWidget {
  final Prediction? prediction;

  const PreditionTile({
    Key? key,
    this.prediction
  }) : super(key: key);

  void getPlaceDetails(String placeId, BuildContext context) async{
    showDialog(
        context: context,
        builder: (BuildContext context) => ProgressDialog(status: 'Please wait...',)
    );
    String url = 'https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=$mapApiKeyAndroid';
    var response = await RequestHelper.getRequestAll(url);


    Navigator.pop(context);
    if(response == 'Failed'){
      return;
    }

    if(response['status'] == 'OK'){
      AddressModel thisPlace = AddressModel();
      thisPlace.placeName = response['result']['name'];
      thisPlace.placeId = placeId;
      thisPlace.latitude = response['result']['geometry']['location']['lat'];
      thisPlace.longitude = response['result']['geometry']['location']['lng'];

      Provider.of<AppData>(context, listen: false).updateDestinationAddress(thisPlace);
      print(thisPlace.placeName);

      Navigator.pop(context, 'getDirection');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        getPlaceDetails(prediction!.placeId!, context);
      },
      child: Container(
        child: Column(
          children: [
            const SizedBox(height: 8,),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: BrandColors.colorDimText,
                ),
                const SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        prediction!.mainText!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 16,
                        ),
                      ),
                      Text(
                        prediction!.secondaryText!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 12,
                            color: BrandColors.colorDimText
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }
}
