import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_trainer/core/di/getx_injection.dart';
import 'package:my_trainer/share/controller/language_controller.dart';

import 'core/di/injection.dart';
import 'core/router/routes.dart';
import 'core/theme/light_theme.dart';
import 'helper/device_utils/device_utils.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DeviceUtils.lockDevicePortrait();
  initGetx();
  initDependencies();

  Map<String, Map<String, String>>? languages = await LanguageController.getLanguages();

  runApp( DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(languages: languages),),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key,this.languages});
  final Map<String, Map<String, String>>? languages;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) => GetMaterialApp.router(
        debugShowCheckedModeBanner: false,

        //Route Section
        routeInformationParser: AppRouter.route.routeInformationParser,
        routerDelegate: AppRouter.route.routerDelegate,
        routeInformationProvider: AppRouter.route.routeInformationProvider,

        //Theme Section
        themeMode: ThemeMode.light,
        theme: lightTheme,
        /* darkTheme: darkTheme,*/

        //Languages Section
        locale: Locale("en", "US"),
        translations: Messages(languages: languages),
        fallbackLocale: const Locale("en", "US"),
      ),
    );
  }
}
