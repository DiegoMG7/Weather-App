import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/start.dart';
import 'package:weatherapp/about.dart';
import 'package:weatherapp/glossary.dart';
import 'styles.dart';
import 'package:weatherapp/services/app_localizations.dart';

class OptionsView extends StatefulWidget {
  @override
  _OptionsViewState createState() => _OptionsViewState();
}

class _OptionsViewState extends State<OptionsView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: ListTile(
            trailing: Icon(Icons.edit_location, size: 50, color: Colors.black),
            title: Text(AppLocalizations.of(context).translate('s55'), style: Styles.textDefault),
            enabled: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Start(),
                ),
              );
            },
          ),
        ),
//        Card(
//          child: ListTile(
//            trailing: Icon(Icons.pin_drop, size: 45, color: Colors.black),
//            title: Text(AppLocalizations.of(context).translate('s56'), style: Styles.textDefault),
//            subtitle: Text(AppLocalizations.of(context).translate('s57')),
//          ),
//        ),
        Card(
          child: ListTile(
            trailing: Icon(Icons.spellcheck, size: 45, color: Colors.black),
            title: Text(AppLocalizations.of(context).translate('s58'), style: Styles.textDefault),
            enabled: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Glossary(),
                ),
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            trailing: Icon(Icons.info, size: 45, color: Colors.black),
            title: Text(AppLocalizations.of(context).translate('s59'), style: Styles.textDefault),
            enabled: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => About(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Options extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text(AppLocalizations.of(context).translate('s54'), style: Styles.navBarTitle)),backgroundColor: Styles.header1Color),
        body:OptionsView(),
    );
  }
}