import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/today.dart';
import 'package:weatherapp/weatherMaps.dart';
import 'package:weatherapp/options.dart';
import 'package:intl/intl.dart';
import 'styles.dart';
import 'package:weatherapp/services/app_localizations.dart';

class Forecast extends StatefulWidget {

  Forecast({this.weather,this.weatherOW,this.time,this.longitude,this.latitude});
  final weather;
  final weatherOW;
  final time;
  final longitude;
  final latitude;

  @override
  _ForecastState createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {
  double lat;
  double lon;
  var mapURL;
  var awData;
  var owData;
  var tzData;

  List<int> weatherCode = List<int>(7);
  List<int> maxTemp = List<int>(7);
  List<int> minTemp = List<int>(7);
  List<String> days = List<String>(7);

  @override
  void initState(){
    super.initState();
    //updateUI(widget.weather,widget.weatherOW,widget.time);
    updateUI(widget.weatherOW,widget.weather,widget.time,widget.longitude,widget.latitude);
    print("OW");
    print(lat);
    print(lon);
  }

  void updateUI(dynamic weatherOW,weather,time,longitude,latitude){
    mapURL = 'https://tile.openweathermap.org/map/clouds/1/1/1.png?appid=54b0c03c77c086a52ee264d043221b63';
    lon = longitude;
    lat = latitude;
    owData = weatherOW;
    awData = weather;
    tzData = time;
    var dateAux;

    for(int i = 0; i < 7; i++){
      dateAux = time.add(new Duration(days: i+1));
      weatherCode[i] = (weatherOW['daily'][i+1]['weather'][0]['id']).toInt();
      maxTemp[i] = (weatherOW['daily'][i+1]['temp']['max']).toInt();
      minTemp[i] = (weatherOW['daily'][i+1]['temp']['min']).toInt();
      days[i] = (DateFormat('EEEE').format(dateAux));
    }
  }
  void reFormatDays() {
    for(int i = 0; i < 7; i++){
      if(days[i] == 'Monday')
        days[i] = AppLocalizations.of(context).translate('s47');
      else if(days[i] == 'Tuesday')
        days[i] = AppLocalizations.of(context).translate('s48');
      else if(days[i] == 'Wednesday')
        days[i] = AppLocalizations.of(context).translate('s49');
      else if(days[i] == 'Thursday')
        days[i] = AppLocalizations.of(context).translate('s50');
      else if(days[i] == 'Friday')
        days[i] = AppLocalizations.of(context).translate('s51');
      else if(days[i] == 'Saturday')
        days[i] = AppLocalizations.of(context).translate('s52');
      else if(days[i] == 'Sunday')
        days[i] = AppLocalizations.of(context).translate('s53');
    }
  }

  Widget forecastData() => DataTable(
    //horizontalMargin: 30,headingRowHeight: 56, columnSpacing: 20,
    columnSpacing: 30,
      columns: [
        DataColumn(label: Text(AppLocalizations.of(context).translate('s43'),style: Styles.textDefault2)),
        DataColumn(label: Text(AppLocalizations.of(context).translate('s44'),style: Styles.textDefault2)),
        DataColumn(label: Text(AppLocalizations.of(context).translate('s45'),style: Styles.textDefault2)),
        DataColumn(label: Text(AppLocalizations.of(context).translate('s46'),style: Styles.textDefault2)),
      ],
      rows: [
        DataRow(cells:[
          DataCell(Text('${days[0]}',style: Styles.textDefault2)),
          DataCell(Image(image: AssetImage('assets/images/${getWeatherIcon(weatherCode[0])}.png'), height: 30, width: 30,)),
          DataCell(Text('${tempConverter(maxTemp[0])}°C',style: Styles.textDefault2)),
          DataCell(Text('${tempConverter(minTemp[0])}°C',style: Styles.textDefault2)),
        ]),
        DataRow(cells:[
          DataCell(Text('${days[1]}',style: Styles.textDefault2)),
          DataCell(Image(image: AssetImage('assets/images/${getWeatherIcon(weatherCode[1])}.png'), height: 30, width: 30,)),
          DataCell(Text('${tempConverter(maxTemp[1])}°C',style: Styles.textDefault2)),
          DataCell(Text('${tempConverter(minTemp[1])}°C',style: Styles.textDefault2)),
        ]),
        DataRow(cells:[
          DataCell(Text('${days[2]}',style: Styles.textDefault2)),
          DataCell(Image(image: AssetImage('assets/images/${getWeatherIcon(weatherCode[2])}.png'), height: 30, width: 30,)),
          DataCell(Text('${tempConverter(maxTemp[2])}°C',style: Styles.textDefault2)),
          DataCell(Text('${tempConverter(minTemp[2])}°C',style: Styles.textDefault2)),
        ]),
        DataRow(cells:[
          DataCell(Text('${days[3]}',style: Styles.textDefault2)),
          DataCell(Image(image: AssetImage('assets/images/${getWeatherIcon(weatherCode[3])}.png'), height: 30, width: 30,)),
          DataCell(Text('${tempConverter(maxTemp[3])}°C',style: Styles.textDefault2)),
          DataCell(Text('${tempConverter(minTemp[3])}°C',style: Styles.textDefault2)),
        ]),
        DataRow(cells:[
          DataCell(Text('${days[4]}',style: Styles.textDefault2)),
          DataCell(Image(image: AssetImage('assets/images/${getWeatherIcon(weatherCode[4])}.png'), height: 30, width: 30,)),
          DataCell(Text('${tempConverter(maxTemp[4])}°C',style: Styles.textDefault2)),
          DataCell(Text('${tempConverter(minTemp[4])}°C',style: Styles.textDefault2)),
        ]),
        DataRow(cells:[
          DataCell(Text('${days[5]}',style: Styles.textDefault2)),
          DataCell(Image(image: AssetImage('assets/images/${getWeatherIcon(weatherCode[5])}.png'), height: 30, width: 30,)),
          DataCell(Text('${tempConverter(maxTemp[5])}°C',style: Styles.textDefault2)),
          DataCell(Text('${tempConverter(minTemp[5])}°C',style: Styles.textDefault2)),
        ]),
        DataRow(cells:[
          DataCell(Text('${days[6]}',style: Styles.textDefault2)),
          DataCell(Image(image: AssetImage('assets/images/${getWeatherIcon(weatherCode[6])}.png'), height: 30, width: 30,)),
          DataCell(Text('${tempConverter(maxTemp[6])}°C',style: Styles.textDefault2)),
          DataCell(Text('${tempConverter(minTemp[6])}°C',style: Styles.textDefault2)),
        ]),
      ],
  );
  @override
  Widget build(BuildContext context) {
    reFormatDays();
    return Scaffold(
      appBar: AppBar(
        /*
        leading: IconButton(
            icon: Icon(Icons.settings),
            color: Styles.btn1Color,
            iconSize: 35,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Options(),
                ),
              );
            },
          ),

         */
        title: Center(child: Text(AppLocalizations.of(context).translate('s41'), style: Styles.navBarTitle)),
        backgroundColor: Styles.header1Color,
          /*
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0,0.0,0.0,0.0),
              child: Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.maybePop(context);
                    },
                    child: Image(image: AssetImage('assets/icons/previous.png')),
                  );
                },
              ),
            )
          ]

           */
      ),
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(230.0,10.0,0.0,0.0),
                child: Text(                                                                   //name of the App
                  //'Temperature',
                  AppLocalizations.of(context).translate('s42'),
                  style: TextStyle(
                      fontFamily: 'SourceSansPro-Regular',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.9),
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Center(child: Expanded(
                  child: SingleChildScrollView(child: forecastData()))
              ),
            ],
          ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0,5.0,0.0,0.0),
                child: Text(                                                                   //name of the App
                  "Options Menu",
                  style:TextStyle(
                    fontFamily: 'SourceSansPro-SemiBold',
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              decoration: BoxDecoration(
                color: Styles.header1Color,
              ),

            ),
            ListTile(
              title: Text('Today'),
              subtitle: Text('Current Weather'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Today(
                      weather: awData,
                      weatherOW: owData,
                      time: tzData,
                      longitude: lon,
                      latitude: lat,
                    ),
                  ),
                );
                //Navigator.pop(context);
              },
              trailing: Icon(Icons.calendar_today, size: 36, color: Colors.black),
            ),
            ListTile(
              title: Text('Forecast'),
              subtitle: Text('Forecast for the next 7 days'),
              onTap: () {

              },
              trailing: Icon(Icons.date_range, size: 36, color: Colors.black),
            ),
            ListTile(
              title: Text('Weather Maps'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherMaps(
                      weather: awData,
                      weatherOW: owData,
                      time: tzData,
                      latitude: lat,
                      longitude: lon,
                    ),
                  ),
                );
                //Navigator.pop(context);
              },
              trailing: Icon(Icons.public, size: 36, color: Colors.black),
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Options(),
                  ),
                );
                //Navigator.pop(context);
              },
              trailing: Icon(Icons.settings, size: 36, color: Colors.black),
            ),
          ],
        ),
      ),
      backgroundColor: Styles.bColor2,
    );
  }
}

int tempConverter(int temp){
  int result;
  result = ((temp-32)*(5/9)).toInt();
  return result;
}

String getWeatherIcon(int code){
  if (code > 199 && code < 233)
    return 'thunderstorm';
  else if (code > 299 && code < 322)
    return 'drizzle';
  else if (code > 499 && code < 532)
    return 'rain';
  else if (code > 599 && code < 623)
    return 'snow';
  else if (code > 700 && code < 782)
    return 'mist';
  else if (code > 799 && code < 802)
    return 'clearsky';
  else if (code == 802)
    return 'scatteredclouds';
  else if (code > 802 && code < 805)
    return 'brokenclouds';
}
String getWindDir(int grades){
  String result;

  if(grades >= 12 && grades <= 56)
    result = 'North-\neast';
  else if(grades >= 57 && grades <= 101)
    result = 'East';
  else if(grades >= 102 && grades <= 146)
    result = 'South-\neast';
  else if(grades >= 147 && grades <= 191)
    result = 'South';
  else if(grades >= 192 && grades <= 236)
    result = 'South-\nwest';
  else if(grades >= 237 && grades <= 281)
    result = 'West';
  else if(grades >= 282 && grades <= 326)
    result = 'North-\nwest';
  else {result = 'North';}

  return result;
}