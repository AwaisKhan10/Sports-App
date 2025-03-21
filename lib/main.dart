import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:get/get.dart';
import 'package:sports_app/ui/auth/register/register_screen.dart';
import 'package:sports_app/ui/auth/sign_in/sign_in_screen.dart';
import 'package:sports_app/ui/screens/drawer/drawer_screen.dart';
import 'package:sports_app/ui/screens/profile/profile_screen.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ///
    ///    i have remove multi provider if need then use it
    ///
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.sizeOf(context).height,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sports App',
          theme: ThemeData(
            // scaffoldBackgroundColor: backGroundColor,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
          ),
          home: DrawerScreen(),
        );
      },
    );
  }
}
