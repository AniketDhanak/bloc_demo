import 'package:bloc_demo_api/constants/color_constants.dart';
import 'package:bloc_demo_api/constants/font_constants.dart';
import 'package:bloc_demo_api/constants/route_constants.dart';
import 'package:bloc_demo_api/constants/string_constants.dart';
import 'package:bloc_demo_api/extension/color_extensions.dart';
import 'package:bloc_demo_api/routes/routes.dart';
import 'package:bloc_demo_api/utils/size_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      return OrientationBuilder(builder: (context, orientation){
      SizeConfig().init(constraints, orientation);
      return MaterialApp(
          title: StringConstants.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: AppColors.primary1.toMaterialColor(),
            fontFamily: FontConstants.roboto,
          ),
          onGenerateRoute: Routes.onGenerateRoute,
          initialRoute: RouteConstants.initRoute,
        );
      });
    });
  }
}
