import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/styles.dart';
import 'package:weatherapp/today.dart';
import 'package:weatherapp/services/networking.dart';
import 'package:weatherapp/services/time.dart';

import 'package:toast/toast.dart';

const apiKeyAW = '50fe79a9f73541dca44c101b95c5de6cd26411e539914f54a695cef96c6aa0ae';
const applicationKeyAW = '9c8b44167f054b019fed793d362074e785514890a1c44863871f68d0b06ed784';
const apiKeyOW = '54b0c03c77c086a52ee264d043221b63';


class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  String dropdownValue = 'Select an option';
  String selectionValue;

  void getData(String valueWS) async {
    String macValue;
    String lat;
    String lon;
    String timeZ;

    if(valueWS == 'Kandahar, Mohammad Akram'){
      macValue = '84:F3:EB:54:51:76';
      lat = '31.62887';
      lon = '65.73717';
      timeZ = 'Asia/Kabul';
    }
    else if(valueWS == 'Panjshir, Big Mohammad Khil'){
      macValue = '84:F3:EB:54:50:54';
      lat = '35.50257';
      lon = '69.95503';
      timeZ = 'Asia/Kabul';
    }
    else if(valueWS == 'MRRD'){
      macValue = 'A4:CF:12:B4:ED:F1';
      lat = '34.47179';
      lon = '69.11896';
      timeZ = 'Asia/Kabul';
    }
    else if(valueWS == 'Kabul, World Bank'){
      macValue = '3C:71:BF:3E:A6:17';
      lat = '34.55534';
      lon = '69.20748';
      timeZ = 'Asia/Kabul';
    }
    else if(valueWS == 'Badakhshan, Qaragh Awal'){
      macValue = 'A4:CF:12:A0:2D:77';
      lat = '36.73477';
      lon = '70.81199';
      timeZ = 'Asia/Kabul';
    }
    else if(valueWS == 'Badakhshan, Sare Kotal'){
      macValue = 'A4:CF:12:B4:ED:F1';
      lat = '36.96944';
      lon = '70.35111';
      timeZ = 'Asia/Kabul';
      //03
    }
    else if(valueWS == 'Badakhshan, Naw Abad Pingani'){
      macValue = 'A4:CF:12:A0:2D:F3';
      lat = '37.00099';
      lon = '70.27300';
      timeZ = 'Asia/Kabul';
      //02
    }
    else if(valueWS == 'Chapel Hill, USA'){
      macValue = '3C:71:BF:3E:A2:C0';
      lat = '35.913199';
      lon = '-79.05584';
      timeZ = 'America/New_York';
    }

    TimeHelper timeHelper = TimeHelper(timeZ);
    var timeData = await timeHelper.setup();
    NetworkHelper networkHelper = NetworkHelper('https://api.ambientweather.net/v1/devices/$macValue?apiKey=$apiKeyAW&applicationKey=$applicationKeyAW&endDate=&limit=288');
    NetworkHelper networkHelperOW = NetworkHelper('https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=hourly,minutely&appid=$apiKeyOW&units=metric');
    var weatherData = await networkHelper.getData();
    var weatherDataOW = await networkHelperOW.getData();

    try {
      if(weatherData[0] == null)
        Toast.show("Weather Station not reporting", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return Today(
            weather: weatherData,
            weatherOW: weatherDataOW,
            time: timeData,
          );
        }));
      }
    } on Exception catch (_) {
      Toast.show("Weather Station not reporting", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    } on Error catch (_){
      Toast.show("Weather Station not reporting", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Styles.header1Color,
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0,20.0,0.0,30.0),
                    child: Text(                                                                   //name of the App
                      'Community WeatherBoard',
                      style:TextStyle(
                        fontFamily: 'SourceSansPro-SemiBold',
                        fontSize: 35.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Image.asset('assets/images/startScr.png',width: 200,height: 200),               //Start Screen image
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0,50.0,10.0,10.0),
                    child: Text(                                                                   //name of the App
                      'Select your Community',
                      style:TextStyle(
                        fontFamily: 'SourceSansPro-SemiBold',
                        fontSize: 28.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                      color: Colors.white,
                      width: 300.0,
                      height: 35.0,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        isDense: true,
                        icon: Icon(Icons.arrow_drop_down),
                        value: dropdownValue,
                        iconSize: 35,
                        elevation: 16,
                        style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'SourceSansPro-SemiBold'),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                            selectionValue = newValue;
                            //print(selectionValue);
                          });
                        },
                        items: <String>['Select an option','Kandahar, Mohammad Akram', 'Panjshir, Big Mohammad Khil', 'Kabul, World Bank','Badakhshan, Qaragh Awal','Badakhshan, Sare Kotal','Badakhshan, Naw Abad Pingani','Chapel Hill, USA']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                  ),
                  const SizedBox(height: 30),                                                     //Button to go to the today screen
                  RaisedButton(
                    color: Styles.btn1Color,
                    textColor: Colors.white,
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 24), textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      getData(selectionValue);
                    },
                  ),
                ],
              ),
            )
        )
    );
  }
}
