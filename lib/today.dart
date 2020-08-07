import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/options.dart';
import 'package:weatherapp/forecast.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'styles.dart';

class Today extends StatefulWidget {

  Today({this.weather,this.weatherOW,this.time});
  final weather;
  final weatherOW;
  final time;

  @override
  _TodayState createState() => _TodayState(); //this is a comment
}

class _TodayState extends State<Today> {
  String date;
  String weatherCondition;
  var sunset;
  var sunrise;
  int weatherCode;
  int maxTemp;
  int minTemp;
  int currTemp;
  String humidity;
  String windSpeedmph;
  int windDirection;
  double dailyRain;
  var awData;
  var owData;
  var tzData;

  @override
  void initState(){
    super.initState();
    updateUI(widget.weather,widget.weatherOW,widget.time);
  }

  void updateUI(dynamic weather,weatherOW,time){
    date = weather [0]['date'] ;
    weatherCondition = weatherOW['current']['weather'][0]['description'];
    sunset = (weatherOW['current']['sunset']).toInt();
    sunrise = (weatherOW['current']['sunrise']).toInt();
    minTemp = (weather [0]['dewPoint']).toInt();
    maxTemp = (weather [0]['tempf']).toInt();
    weatherCode = (weatherOW['current']['weather'][0]['id']).toInt();
    currTemp = (weatherOW['current']['temp']).toInt();
    humidity = (weather [0]['humidity']).toString();
    windDirection = (weather [0]['winddir']).toInt();
    windSpeedmph = (weather [0]['windspeedmph']).toString();
    dailyRain = (weather [0]['dailyrainin']).toDouble();

    awData = weather;
    owData = weatherOW;
    tzData = time;
  }

  Widget weatherData() => DataTable(
      columns: [
        DataColumn(label: Text('Measurement',style: Styles.header2)),
        DataColumn(label: Text('',style: Styles.header2)),
        DataColumn(label: Text('Reading',style: Styles.header2)),
      ],
      rows: [
        DataRow(cells:[
          DataCell(Text('Time of Reading',style: Styles.textDefault)),
          DataCell(Icon(Icons.access_time, size: 36, color: Colors.black)),
          DataCell(Text('${hourConverter(tzData)}',style: Styles.textDefault)),

        ]),
        DataRow(cells:[
          DataCell(Text('Current Temperature',style: Styles.textDefault)),
          DataCell(SvgPicture.asset('assets/icons/currTemp.svg',color: Colors.black,height: 40,width: 40)),
          //DataCell(Image(image: AssetImage('assets/icons/avgTemp.png'))),
          DataCell(Text('$currTemp°C',style: Styles.textDefault)),

        ]),
        DataRow(cells:[
          DataCell(Text('Max Temperature',style: Styles.textDefault)),
          //DataCell(Image(image: AssetImage('assets/icons/maxTemp.png'))),
          DataCell(SvgPicture.asset('assets/icons/maxTemp.svg',color: Colors.black,height: 40,width: 40)),
          DataCell(Text('${tempConverter(maxTemp)}°C',style: Styles.textDefault)),
        ]),
        DataRow(cells:[
          DataCell(Text('Min Temperature',style: Styles.textDefault)),
          //DataCell(Image(image: AssetImage('assets/icons/minTemp.png'))),
          DataCell(SvgPicture.asset('assets/icons/minTemp.svg',color: Colors.black,height: 40,width: 40)),
          DataCell(Text('${tempConverter(minTemp)}°C',style: Styles.textDefault)),
        ]),
        DataRow(cells:[
          DataCell(Text('Humidity',style: Styles.textDefault)),
          DataCell(SvgPicture.asset('assets/icons/humidity.svg',color: Colors.black,height: 35,width: 35)),
          //DataCell(Image(image: AssetImage('assets/icons/humidity.png'))),
          DataCell(Text('$humidity%',style: Styles.textDefault)),
        ]),
        DataRow(cells:[
          DataCell(Text('Wind Direction',style: Styles.textDefault)),
          //DataCell(Image(image: AssetImage('assets/icons/compass-solid.svg'))),
          DataCell(SvgPicture.asset('assets/icons/compass.svg',color: Colors.black,height: 30,width: 30)),
          DataCell(Text('${windDir(windDirection)}',style: Styles.textDefault)),
        ]),
        DataRow(cells:[
          DataCell(Text('Wind Speed',style: Styles.textDefault)),
          DataCell(SvgPicture.asset('assets/icons/wind.svg',color: Colors.black,height: 30,width: 30)),
          //DataCell(Image(image: AssetImage('assets/icons/wind.png'))),
          DataCell(Text('$windSpeedmph kph',style: Styles.textDefault)),
        ]),
        DataRow(cells:[
          DataCell(Text('Precipitation',style: Styles.textDefault)),
          //DataCell(Image(image: AssetImage('assets/icons/rain.png'))),
          DataCell(SvgPicture.asset('assets/icons/precipitation.svg',color: Colors.black,height: 30,width: 30)),
          DataCell(Text('${rainConverter(dailyRain)}mm',style: Styles.textDefault)),

        ]),
        DataRow(cells:[
          DataCell(Text('Sunrise',style: Styles.textDefault)),
          //DataCell(Image(image: AssetImage('assets/icons/sunrise.png'))),
          DataCell(SvgPicture.asset('assets/icons/sunrise.svg',color: Colors.black,height: 40,width: 40)),
          DataCell(Text('${timestampConverter(sunrise)}',style: Styles.textDefault)),

        ]),
        DataRow(cells:[
          DataCell(Text('Sunset',style: Styles.textDefault)),
          //DataCell(Image(image: AssetImage('assets/icons/sunset.png'))),
          DataCell(SvgPicture.asset('assets/icons/sunset.svg',color: Colors.black,height: 40,width: 40)),
          DataCell(Text('${timestampConverter(sunset)}',style: Styles.textDefault)),

        ]),
      ],
      columnSpacing: 30.0
  );

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();

    return Scaffold(
        appBar: AppBar(leading: IconButton(
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
          //title: Text('${dateConverter(tzData)}', style: Styles.navBarTitle),
          title: Center(child: Text('${dateConverter(tzData)}', style: Styles.navBarTitle)),
          backgroundColor: Styles.header1Color,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 1.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Forecast(
                        weather: awData,
                        weatherOW: owData,
                        time: tzData,
                      ),
                    ),
                  );
                },
                child: Image(image: AssetImage('assets/icons/next.png')),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                child: Row(children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(70.0,0.0,10.0,0.0),
                      child: Image.asset('assets/images/${getWeatherIcon(weatherCode)}.png',alignment: Alignment.center,height: 65,width: 65)
                  ),
                  Text(                                                                   //name of the App
                    '$weatherCondition',
                    style: Styles.header1,
                    textAlign: TextAlign.right,
                  ),
                ],),
                color: Styles.bColor2,
              ),
              Expanded(
                child: Scrollbar(
                  controller: _scrollController,
                  isAlwaysShown: true,
                  child: SingleChildScrollView(
                      controller: _scrollController,
                      child: weatherData()
                  ),
                ),
              ),
            ],
          ),
        )
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

String windDir(int grades){
  String result;

  if(grades >= 12 && grades <= 56)
    result = 'Northeast';
  else if(grades >= 57 && grades <= 101)
    result = 'East';
  else if(grades >= 102 && grades <= 146)
    result = 'Southeast';
  else if(grades >= 147 && grades <= 191)
    result = 'South';
  else if(grades >= 192 && grades <= 236)
    result = 'Southwest';
  else if(grades >= 237 && grades <= 281)
    result = 'West';
  else if(grades >= 282 && grades <= 326)
    result = 'Northwest';
  else {result = 'North';}

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

String timestampConverter(var timestamp){
  var timeS = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var timeSConverted = (DateFormat('h:mm a').format(timeS));
  return timeSConverted;
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