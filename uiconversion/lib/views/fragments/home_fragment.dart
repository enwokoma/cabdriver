import 'package:flutter/material.dart';
import 'package:uiconversion/app/styles/text_styles.dart';
import 'package:uiconversion/app/widgets/top_button.dart';
import 'package:uiconversion/models/country_list_model.dart';

class HomeFragment extends StatefulWidget {

  const HomeFragment({Key? key}) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  List<CountryModel>? countryModelList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryModelList!.add(
      CountryModel(
          'assets/images/flags/us_flag.png',
          'US Dollar',
          '369.63 USD'
      ),
    );

    countryModelList!.add(
      CountryModel(
          'assets/images/flags/flag_nigeria.png',
          'Nigerian Naira',
          '800,581.05 NGN'
      ),
    );

    countryModelList!.add(
      CountryModel(
          'assets/images/flags/ghana.png',
          'Ghana Cedi',
          '0.28 GHS'
      ),
    );

    countryModelList!.add(
      CountryModel(
          'assets/images/flags/kenya.png',
          'Kenya Shilling',
          '95.00 KES'
      ),
    );

    countryModelList!.add(
      CountryModel(
          'assets/images/flags/south-africa.png',
          'South African Rand',
          '0.00 ZAR'
      ),
    );

    countryModelList!.add(
      CountryModel(
          'assets/images/flags/cameroon.png',
          'Cameroon Francs',
          '200.5 CAF'
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Container(
              height: size.height * .32,
              color: const Color(0xFF303E9E),
              padding: const EdgeInsets.all(14),
              width: size.width,
              child: Column(
                children: [
                  SizedBox(height: size.height * .09,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hello \$miracle,',
                        style: appBoldStyleWhite,
                      ),

                      Image.asset(
                        'assets/images/bar_code.png'
                      )
                    ],
                  ),

                  const SizedBox(height: 12,),

                  Row(
                    children: [
                      Text(
                        'What would you like to do today?',
                        style: appNormalStyleWhite,
                      ),
                    ],
                  ),

                  Row(
                    children: const [
                      TopButton(
                        text: 'FUND WALLET',
                      ),
                      SizedBox(width: 18,),
                      TopButton(
                        text: 'WITHDRAW',
                      )
                    ],
                  )
                ],
              ),
            ),

            Container(
              color: const Color(0xFFF5F5F5),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Text(
                      'WALLETS',
                    style: appBoldStyleBlack,
                  )
                ],
              ),
            ),


            Expanded(child: SingleChildScrollView(
              child: ListView.separated(
                itemCount: countryModelList!.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) =>  Divider(
                  color: Colors.black.withOpacity(.5),
                ),
                itemBuilder: (context, index) => ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading:  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 26,
                    child: ClipOval(
                      child: Image.asset(
                          countryModelList![index].imageAsset!
                      ),
                    ),
                  ),
                  title: Text(
                    countryModelList![index].currency!,
                    style: appNormalStyleBlack,
                  ),
                  trailing: Text(
                    countryModelList![index].amount!,
                    style: appBoldStyleBlackSmaller,
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
