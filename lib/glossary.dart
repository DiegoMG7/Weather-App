import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'styles.dart';
import 'package:weatherapp/services/app_localizations.dart';

class Glossary extends StatefulWidget {
  @override
  _GlossaryState createState() => _GlossaryState();
}

class _GlossaryState extends State<Glossary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(AppLocalizations.of(context).translate('s60'), style: Styles.navBarTitle)),backgroundColor: Styles.header1Color),
      body:ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Center(child: Text(AppLocalizations.of(context).translate('s61'), style: Styles.header2)),
            ),
          ),
          Card(
            child: ListTile(
              leading: SvgPicture.asset('assets/icons/currTemp.svg',color: Colors.black,height: 40,width: 40),
              title: Text(AppLocalizations.of(context).translate('s62'), style: Styles.textDefault),
              subtitle: Text(AppLocalizations.of(context).translate('s63'), style: TextStyle(fontSize: 16, fontFamily: 'SourceSansPro-Regular')),
            ),
          ),
          Card(
            child: ListTile(
              leading: SvgPicture.asset('assets/icons/humidity.svg',color: Colors.black,height: 35,width: 35),
              title: Text(AppLocalizations.of(context).translate('s64'), style: Styles.textDefault),
              subtitle: Text(AppLocalizations.of(context).translate('s65'), style: TextStyle(fontSize: 16, fontFamily: 'SourceSansPro-Regular')),
            ),
          ),
          Card(
            child: ListTile(
              leading: SvgPicture.asset('assets/icons/maxTemp.svg',color: Colors.black,height: 40,width: 40),
              title: Text(AppLocalizations.of(context).translate('s66'), style: Styles.textDefault),
              subtitle: Text(AppLocalizations.of(context).translate('s67'), style: TextStyle(fontSize: 16, fontFamily: 'SourceSansPro-Regular')),
            ),
          ),
          Card(
            child: ListTile(
              leading: SvgPicture.asset('assets/icons/minTemp.svg',color: Colors.black,height: 40,width: 40),
              title: Text(AppLocalizations.of(context).translate('s68'), style: Styles.textDefault),
              subtitle: Text(AppLocalizations.of(context).translate('s69'), style: TextStyle(fontSize: 16, fontFamily: 'SourceSansPro-Regular')),
            ),
          ),
          Card(
            child: ListTile(
              leading: SvgPicture.asset('assets/icons/precipitation.svg',color: Colors.black,height: 30,width: 30),
              title: Text(AppLocalizations.of(context).translate('s70'), style: Styles.textDefault),
              subtitle: Text(AppLocalizations.of(context).translate('s71'), style: TextStyle(fontSize: 16, fontFamily: 'SourceSansPro-Regular')),
            ),
          ),
          Card(
            child: ListTile(
              leading: SvgPicture.asset('assets/icons/sunrise.svg',color: Colors.black,height: 40,width: 40),
              title: Text(AppLocalizations.of(context).translate('s72'), style: Styles.textDefault),
              subtitle: Text(AppLocalizations.of(context).translate('s73'), style: TextStyle(fontSize: 16, fontFamily: 'SourceSansPro-Regular')),
            ),
          ),
          Card(
            child: ListTile(
              leading: SvgPicture.asset('assets/icons/sunset.svg',color: Colors.black,height: 40,width: 40),
              title: Text(AppLocalizations.of(context).translate('s74'), style: Styles.textDefault),
              subtitle: Text(AppLocalizations.of(context).translate('s75'), style: TextStyle(fontSize: 16, fontFamily: 'SourceSansPro-Regular')),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.access_time, size: 36, color: Colors.black),
              title: Text(AppLocalizations.of(context).translate('s76'), style: Styles.textDefault),
              subtitle: Text(AppLocalizations.of(context).translate('s77'), style: TextStyle(fontSize: 16, fontFamily: 'SourceSansPro-Regular')),
            ),
          ),
          Card(
            child: ListTile(
              leading: SvgPicture.asset('assets/icons/compass.svg',color: Colors.black,height: 30,width: 30),
              title: Text(AppLocalizations.of(context).translate('s78'), style: Styles.textDefault),
              subtitle: Text(AppLocalizations.of(context).translate('s79'), style: TextStyle(fontSize: 16, fontFamily: 'SourceSansPro-Regular')),
            ),
          ),
          Card(
            child: ListTile(
              leading: SvgPicture.asset('assets/icons/wind.svg',color: Colors.black,height: 30,width: 30),
              title: Text(AppLocalizations.of(context).translate('s80'), style: Styles.textDefault),
              subtitle: Text(AppLocalizations.of(context).translate('s81'), style: TextStyle(fontSize: 16, fontFamily: 'SourceSansPro-Regular')),
            ),
          ),
          Card(
            child: ListTile(
              title: Center(child: Text(AppLocalizations.of(context).translate('s82'), style: Styles.header2)),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/brokenclouds.png'),
              title: Text(AppLocalizations.of(context).translate('s83'), style: Styles.textDefault),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/clearsky.png'),
              title: Text(AppLocalizations.of(context).translate('s84'), style: Styles.textDefault),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/drizzle.png'),
              title: Text(AppLocalizations.of(context).translate('s85'), style: Styles.textDefault),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/mist.png'),
              title: Text(AppLocalizations.of(context).translate('s86'), style: Styles.textDefault),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/rain.png'),
              title: Text(AppLocalizations.of(context).translate('s87'), style: Styles.textDefault),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/scatteredclouds.png'),
              title: Text(AppLocalizations.of(context).translate('s88'), style: Styles.textDefault),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/snow.png'),
              title: Text(AppLocalizations.of(context).translate('s89'), style: Styles.textDefault),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/thunderstorm.png'),
              title: Text(AppLocalizations.of(context).translate('s90'), style: Styles.textDefault),
            ),
          ),
        ],
      )
    );
  }
}
