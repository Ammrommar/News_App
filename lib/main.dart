import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:news_app/home/content_screen.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/providers/app_config_provider.dart';
import 'package:news_app/providers/search_provider.dart';
import 'package:provider/provider.dart';
import 'home/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppConfigProvider()),
      ChangeNotifierProvider(create: (context) => SearchProvider()),
    ],
    child: MyApp(),
  ));

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        ContentScreen.routeName: (context) => ContentScreen(),
      },
      theme: MyTheme.lightTheme,
      locale: Locale(provider.appLanguage),
    );
  }
}
