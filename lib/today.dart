import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/options.dart';
import 'package:weatherapp/forecast.dart';
import 'package:weatherapp/weatherMaps.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'styles.dart';
import 'package:weatherapp/services/app_localizations.dart';

class Today extends StatefulWidget {
  Today({this.weather,this.weatherOW,this.time,this.longitude,this.latitude});
  final weather;
  final weatherOW;
  final time;
  final longitude;
  final latitude;

  @override
  _TodayState createState() => _TodayState(); //this is a comment
}

class _TodayState extends State<Today> {
  String date;
  String locationOW;
  String weatherCondition;
  double lat;
  double lon;
  var sunset;
  var mapURL;
  var map;
  var sunrise;
  int weatherCode;
  int maxTemp;
  int minTemp;
  int currTemp;
  String humidity;
  int windSpeedmph;
  int windDirection;
  var dailyRain;
  var awData;
  var owData;
  var tzData;


  @override
  void initState(){
    super.initState();

    try {
      updateUI(widget.weatherOW,widget.weather,widget.time,widget.longitude,widget.latitude);
      print("AWtoday");
    } on Exception catch (_) {
      print('EXCEPTION FOUND AT TODAY PAGE');
      updateUI2(widget.weatherOW,widget.weather,widget.time,widget.longitude,widget.latitude);
      print("OWtoday");
    } on Error catch (_){
      print('Error FOUND AT TODAY PAGE');
      updateUI2(widget.weatherOW,widget.weather,widget.time,widget.longitude,widget.latitude);
      print("OWtoday");
    }

//    if(widget.weather != null || widget.weather != 0 || widget.weather[0] != null || widget.weather[0] != 0){
//      updateUI(widget.weatherOW,widget.weather,widget.time,widget.longitude,widget.latitude);
//      print("AWtoday");
//    }
//    else{
//      updateUI2(widget.weatherOW,widget.weather,widget.time,widget.longitude,widget.latitude);
//      print("OWtoday");
//      print(lat);
//      print(lon);
//    }
  }

  void updateUI(dynamic weatherOW,weather,time,longitude,latitude){
    //date = weather[0]['date'] ;
    locationOW = weatherOW['timezone'];
    weatherCondition = weatherOW['current']['weather'][0]['description'];
    sunset = (weatherOW['current']['sunset']).toInt();
    sunrise = (weatherOW['current']['sunrise']).toInt();
    minTemp = (weather[0]['dewPoint']).toInt();
    maxTemp = (weather[0]['tempf']).toInt();
    weatherCode = (weatherOW['current']['weather'][0]['id']).toInt();
    currTemp = (weatherOW['current']['temp']).toInt();
    humidity = (weather[0]['humidity']).toString();
    windDirection = (weather[0]['winddir']).toInt();
    windSpeedmph = (weatherOW['current']['wind_speed']).toInt();
//    dailyRain = weatherOW['current']['rain'];
//
//    if(dailyRain == null){
//      dailyRain = 0;
//    }

    try {
      dailyRain = weatherOW['current']['rain']['1h'];
    } on Exception catch (_) {
      dailyRain = 0;
    } on Error catch (_){
      dailyRain = 0;
    }

    lon = longitude;
    lat = latitude;
    awData = weather;
    owData = weatherOW;
    tzData = time;
  }
  void updateUI2(dynamic weatherOW,weather,time,longitude,latitude){
    locationOW = weatherOW['timezone'];
    weatherCondition = weatherOW['current']['weather'][0]['description'];
    sunset = (weatherOW['current']['sunset']).toInt();
    sunrise = (weatherOW['current']['sunrise']).toInt();
    minTemp = (weatherOW['daily'][0]['temp']['min']).toInt();
    maxTemp = (weatherOW['daily'][0]['temp']['max']).toInt();
    weatherCode = (weatherOW['current']['weather'][0]['id']).toInt();
    currTemp = (weatherOW['current']['temp']).toInt();
    humidity = (weatherOW['current']['humidity']).toString();
    windDirection = (weatherOW['current']['wind_deg']).toInt();
    windSpeedmph = (weatherOW['current']['wind_speed']).toInt();
    //dailyRain = weatherOW['current']['rain']['1h'];

    try {
      dailyRain = weatherOW['current']['rain']['1h'];
    } on Exception catch (_) {
      dailyRain = 0;
    } on Error catch (_){
      dailyRain = 0;
    }

    mapURL = 'https://tile.openweathermap.org/map/clouds/1/1/1.png?appid=54b0c03c77c086a52ee264d043221b63';
    lon = longitude;
    lat = latitude;
    awData = weather;
    owData = weatherOW;
    tzData = time;
  }


  Widget weatherData() => DataTable(
      columns: [
        DataColumn(label: Text(AppLocalizations.of(context).translate('s13'),style: Styles.header2)),
        DataColumn(label: Text('',style: Styles.header2)),
        DataColumn(label: Text(AppLocalizations.of(context).translate('s14'),style: Styles.header2)),
      ],
      rows: [
        DataRow(cells:[
          DataCell(Text(AppLocalizations.of(context).translate('s15'),style: Styles.textDefault)),
          DataCell(Icon(Icons.access_time, size: 36, color: Colors.black)),
          DataCell(Text('${hourConverter(tzData)}',style: Styles.textDefault)),
        ]),
        DataRow(cells:[
          DataCell(Text(AppLocalizations.of(context).translate('s16'),style: Styles.textDefault)),
          DataCell(SvgPicture.asset('assets/icons/currTemp.svg',color: Colors.black,height: 40,width: 40)),
          DataCell(Text('${tempConverter(currTemp)}°C',style: Styles.textDefault)),

        ]),
        DataRow(cells:[
          DataCell(Text(AppLocalizations.of(context).translate('s17'),style: Styles.textDefault)),
          DataCell(SvgPicture.asset('assets/icons/maxTemp.svg',color: Colors.black,height: 40,width: 40)),
          DataCell(Text('${tempConverter(maxTemp)}°C',style: Styles.textDefault)),
        ]),
        DataRow(cells:[
          DataCell(Text(AppLocalizations.of(context).translate('s18'),style: Styles.textDefault)),
          DataCell(SvgPicture.asset('assets/icons/minTemp.svg',color: Colors.black,height: 40,width: 40)),
          DataCell(Text('${tempConverter(minTemp)}°C',style: Styles.textDefault)),
        ]),
        DataRow(cells:[
          DataCell(Text(AppLocalizations.of(context).translate('s19'),style: Styles.textDefault)),
          DataCell(SvgPicture.asset('assets/icons/humidity.svg',color: Colors.black,height: 35,width: 35)),
          DataCell(Text('$humidity%',style: Styles.textDefault)),
        ]),
        DataRow(cells:[
          DataCell(Text(AppLocalizations.of(context).translate('s20'),style: Styles.textDefault)),
          DataCell(SvgPicture.asset('assets/icons/compass.svg',color: Colors.black,height: 30,width: 30)),
          DataCell(Text('${windDir(windDirection, context)}',style: Styles.textDefault)),
        ]),
        DataRow(cells:[
          DataCell(Text(AppLocalizations.of(context).translate('s21'),style: Styles.textDefault)),
          DataCell(SvgPicture.asset('assets/icons/wind.svg',color: Colors.black,height: 30,width: 30)),
          DataCell(Text('${mileConverter(windSpeedmph)} kph',style: Styles.textDefault)),
        ]),
        DataRow(cells:[
          DataCell(Text(AppLocalizations.of(context).translate('s22'),style: Styles.textDefault)),
          DataCell(SvgPicture.asset('assets/icons/precipitation.svg',color: Colors.black,height: 30,width: 30)),
          DataCell(Text('$dailyRain mm',style: Styles.textDefault)),

        ]),
        DataRow(cells:[
          DataCell(Text(AppLocalizations.of(context).translate('s23'),style: Styles.textDefault)),
          DataCell(SvgPicture.asset('assets/icons/sunrise.svg',color: Colors.black,height: 40,width: 40)),
          DataCell(Text('${timestampConverter(sunrise)}',style: Styles.textDefault)),

        ]),
        DataRow(cells:[
          DataCell(Text(AppLocalizations.of(context).translate('s24'),style: Styles.textDefault)),
          DataCell(SvgPicture.asset('assets/icons/sunset.svg',color: Colors.black,height: 40,width: 40)),
          DataCell(Text('${timestampConverter(sunset)}',style: Styles.textDefault)),

        ]),
      ],
      columnSpacing: 25.0
  );

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
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
          //title: Center(child: Text('${dateConverter(tzData)}', style: Styles.navBarTitle)),
          title: Center(child: Text('$locationOW', style: Styles.navBarTitle)),
          backgroundColor: Styles.header1Color,
        ),
        body: SafeArea(
          child: Scrollbar(
            controller: _scrollController,
            isAlwaysShown: true,
            child: SingleChildScrollView(
              controller: _scrollController,
              //isAlwaysShown: true,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Styles.bColor2,
                    //alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0,5.0,10.0,5.0),
                          child: Image.asset('assets/images/${getWeatherIcon2(weatherCode)}.png',alignment: Alignment.center,height: 50,width: 50),
                        ),
                        Text(
                          getWeatherIcon(weatherCode,context),
                          style: Styles.header1,
                          textAlign: TextAlign.right,
                        ),
                      ],),
                  ),
                  weatherData(),
                ],
              ),
            ),
          ),
          /*
          return new FlutterMap(
      options: new MapOptions(
        center: new LatLng(lat,lon),//new LatLng(51.5, -0.09),
        zoom: 3.0,
      ),
      layers: [
        new TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']
        ),
        new TileLayerOptions(
            urlTemplate: "https://tile.openweathermap.org/map/{layer}/{z}/{x}/{y}.png?appid={APIkey}",
            opacity: 0.8,
            additionalOptions: {
              'APIkey': '54b0c03c77c086a52ee264d043221b63',
              'layer': 'temp_new',
            },
        ),
        new MarkerLayerOptions(
          markers: [
            new Marker(
              width: 80.0,
              height: 80.0,
              point: new LatLng(lat,lon),//new LatLng(51.5, -0.09),
              builder: (ctx) =>
              new Container(
                child: //new FlutterLogo(),
                Icon(Icons.person_pin_circle, size: 50)
              ),
            ),
          ],
        ),
      ],
    );
           */ //Fluttermap
          /*
          child: Column(
            children: <Widget>[
              Container(
                color: Styles.bColor2,
                //alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0,5.0,10.0,5.0),
                      child: Image.asset('assets/images/${getWeatherIcon2(weatherCode)}.png',alignment: Alignment.center,height: 50,width: 50),
                    ),
                    Text(
                    getWeatherIcon(weatherCode,context),
                    style: Styles.header1,
                    textAlign: TextAlign.right,
                  ),
                ],),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: weatherData(),
                ),
                /*
                child: Scrollbar(
                  controller: _scrollController,
                  isAlwaysShown: true,
                  child: SingleChildScrollView(
                      controller: _scrollController,
                      child: weatherData()
                  ),
                ),

                 */
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0,5.0,5.0,5.0),
                child: Text(                                                                   //name of the App
                  "Weather Maps",
                  style:TextStyle(
                    fontFamily: 'SourceSansPro-SemiBold',
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                color: Colors.black,
                child: Image.network('https://tile.openweathermap.org/map/clouds/1/1/1.png?appid=54b0c03c77c086a52ee264d043221b63'),
              )
            ],
          ),

           */
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
                //Navigator.pop(context);
              },
              trailing: Icon(Icons.calendar_today, size: 36, color: Colors.black),
            ),
            ListTile(
              title: Text('Forecast'),
              subtitle: Text('Forecast for the next 7 days'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Forecast(
                      weather: awData,
                      weatherOW: owData,
                      time: tzData,
                      longitude: lon,
                      latitude: lat,
                    ),
                  ),
                );
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

    );
  }
}


int tempConverter(int temp){
  int result;
  result = ((temp-32)*(5/9)).toInt();
  return result;
}

double rainConverter (double rain){
  double result;
  result = ((rain)*(25.4)).roundToDouble();
  return result;
}

String windDir(int grades, context){
  String result;

  if(grades >= 12 && grades <= 56)
    //result = 'Northeast';
    result = AppLocalizations.of(context).translate('s25');
  else if(grades >= 57 && grades <= 101)
    result = AppLocalizations.of(context).translate('s26');//East
  else if(grades >= 102 && grades <= 146)
    result = AppLocalizations.of(context).translate('s27');//Southeast
  else if(grades >= 147 && grades <= 191)
    result = AppLocalizations.of(context).translate('s28');//South
  else if(grades >= 192 && grades <= 236)
    result = AppLocalizations.of(context).translate('s29');//Southwest
  else if(grades >= 237 && grades <= 281)
    result = AppLocalizations.of(context).translate('s30');//West
  else if(grades >= 282 && grades <= 326)
    result = AppLocalizations.of(context).translate('s31');//Northwest
  else {result = AppLocalizations.of(context).translate('s32');}//North

  return result;
}


String dateConverter(var tzData){
  var dateConverted = (DateFormat('EEEE d MMM, yyyy').format(tzData));
  return dateConverted;
  //print(dateConverted);
}

String hourConverter(var tzData){
  var hourConverted = (DateFormat('h:mm a').format(tzData));
  return hourConverted;
  //print(hourConverted);
}

int mileConverter(int mile){
  int km = 0;
  km = (mile*1.609344).toInt();
  return km;
}

String timestampConverter(var timestamp){
  var timeS = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var timeSConverted = (DateFormat('h:mm a').format(timeS));
  return timeSConverted;
}

String getWeatherIcon(int code, context){ //this one is for the text of the weather condition
  if (code > 199 && code < 233)
    return AppLocalizations.of(context).translate('s33');//thunderstorm
  else if (code > 299 && code < 322)
    return AppLocalizations.of(context).translate('s34');//drizzle
  else if (code > 499 && code < 532)
    return AppLocalizations.of(context).translate('s35');//rain
  else if (code > 599 && code < 623)
    return AppLocalizations.of(context).translate('s36');//snow
  else if (code > 700 && code < 782)
    return AppLocalizations.of(context).translate('s37');//mist
  else if (code > 799 && code < 802)
    return AppLocalizations.of(context).translate('s38');//clearsky
  else if (code == 802)
    return AppLocalizations.of(context).translate('s39');//scatteredclouds
  else if (code > 802 && code < 805)
    return AppLocalizations.of(context).translate('s40');//brokenclouds
}

String getWeatherIcon2(int code){ //This one will get the right image
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