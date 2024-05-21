import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_flutter/app_init.dart';
import 'package:weather_flutter/core/api/dio_api_client.dart';
import 'package:weather_flutter/core/util/navigator_util.dart';
import 'package:weather_flutter/features/settings/application/settings_view_model.dart';
import 'package:weather_flutter/features/weather/application/weather_viewmodel.dart';
import 'package:weather_flutter/features/weather/data/weather_repository.dart';
import 'package:weather_flutter/features/weather/presentation/login_view.dart';

void main() async {
  await AppInit.initWeatherApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('tr')],
      useOnlyLangCode: true,
      path: 'assets/translations',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherViewModel(
            weatherRepository: WeatherRepository(
              apiClient: DioApiClient(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsViewModel(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        navigatorKey: NavigatorUtil.navigatorKey,
        home: const LoginView(),
      ),
    );
  }
}
