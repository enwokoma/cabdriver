import 'package:dellioo/core/enums/environment.dart';

import 'main_common.dart';

Future<void> main() async{
  await mainCommon(Environment.PROD);
}