import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/services/app_localizations.dart';
import 'package:weatherapp/start.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class App extends StatefulWidget
{

  static void setLocale(BuildContext context, Locale locale){
    _AppState state = context.findAncestorStateOfType<_AppState>();
    state.setLocale(locale);
  }

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Locale _locale;

  void setLocale(Locale locale){
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      locale: _locale,
      //List of all supported locales
      supportedLocales:[
        Locale('da', ''),
        Locale('pa', ''),
        Locale('en', ''),
      ],
      //These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates:[
        //Class to load the translations from JSON files
        AppLocalizations.delegate,
        //Built in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
      ],
      //returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales){
        for(var supportedLocale in supportedLocales){
          if(supportedLocale.languageCode == locale.languageCode && supportedLocale.countryCode == locale.countryCode){
            return supportedLocale;
          }
        }
        return supportedLocales.elementAt(2);
      },

      home: Start(),
    );
  }
}