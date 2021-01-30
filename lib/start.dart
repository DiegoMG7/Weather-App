import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/styles.dart';
import 'package:weatherapp/today.dart';
import 'package:weatherapp/app.dart';
import 'package:weatherapp/services/networking.dart';
import 'package:weatherapp/services/time.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/services/app_localizations.dart';
import 'services/location.dart';
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;

import 'package:toast/toast.dart';

const apiKeyAW = '50fe79a9f73541dca44c101b95c5de6cd26411e539914f54a695cef96c6aa0ae';
const applicationKeyAW = '9c8b44167f054b019fed793d362074e785514890a1c44863871f68d0b06ed784';
const apiKeyOW = '54b0c03c77c086a52ee264d043221b63';


class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

enum SingingCharacter {English,Dari,Pashto}

class _StartState extends State<Start> {

  double latitude;
  double longitude;
  String selectionValue;
  Locale _temp;
  SingingCharacter _character;

  /*
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

   */


  void getLocationData() async{
    String timeZ;
    String macValue;
    String lat;
    String lon;
    NetworkHelper networkHelperAW;
    NetworkHelper networkHelperOW;
    //NetworkHelper networkHelperOW2;
    var weatherDataAW;
    var weatherDataOW;
    //var weatherMapImage;
    //var currentWeatherDataOW;

    Location location = Location();
    await location.getCurrentLocation();
    longitude = location.longitude;
    latitude = location.latitude;
    timeZ = tzmap.latLngToTimezoneString(latitude, longitude);


    if(Geolocator.distanceBetween(31.62887, 65.73717, latitude, longitude) < 2000){  //'Kandahar, Mohammad Akram'
      //AppLocalizations.of(context).translate('s4')
      print("test");
      macValue = '84:F3:EB:54:51:76';
      latitude = 31.62887;
      longitude = 65.73717;
      networkHelperAW = NetworkHelper('https://api.ambientweather.net/v1/devices/$macValue?apiKey=$apiKeyAW&applicationKey=$applicationKeyAW&endDate=&limit=10');
      networkHelperOW = NetworkHelper('https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=hourly,minutely&appid=$apiKeyOW&units=imperial');
    }
    else if(Geolocator.distanceBetween(35.50257, 69.95503, latitude, longitude) < 2000){  //'Panjshir, Big Mohammad Khil'
      //AppLocalizations.of(context).translate('s5')
      print("test");
      macValue = '84:F3:EB:54:50:54';
      latitude = 35.50257;
      longitude = 69.95503;
      networkHelperAW = NetworkHelper('https://api.ambientweather.net/v1/devices/$macValue?apiKey=$apiKeyAW&applicationKey=$applicationKeyAW&endDate=&limit=10');
      networkHelperOW = NetworkHelper('https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=hourly,minutely&appid=$apiKeyOW&units=imperial');
    }
    else if(Geolocator.distanceBetween(34.55534, 69.20748, latitude, longitude) < 2000){  //'Kabul, World Bank'
      //AppLocalizations.of(context).translate('s6')
      print("test");
      macValue = '3C:71:BF:3E:A6:17';
      latitude = 34.55534;
      longitude = 69.20748;
      //latitude = 34.5327;
      //longitude = 69.1841;
      networkHelperAW = NetworkHelper('https://api.ambientweather.net/v1/devices/$macValue?apiKey=$apiKeyAW&applicationKey=$applicationKeyAW&endDate=&limit=10');
      networkHelperOW = NetworkHelper('https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=hourly,minutely&appid=$apiKeyOW&units=imperial');

    }
    else if(Geolocator.distanceBetween(36.73477, 70.81199, latitude, longitude) < 2000){  //'Badakhshan, Qaragh Awal'
      //AppLocalizations.of(context).translate('s7')
      print("test");
      macValue = 'A4:CF:12:A0:2D:77';
      latitude = 36.73477;
      longitude = 70.81199;
      networkHelperAW = NetworkHelper('https://api.ambientweather.net/v1/devices/$macValue?apiKey=$apiKeyAW&applicationKey=$applicationKeyAW&endDate=&limit=10');
      networkHelperOW = NetworkHelper('https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=hourly,minutely&appid=$apiKeyOW&units=imperial');
    }
    else if(Geolocator.distanceBetween(36.96944, 70.35111, latitude, longitude) < 2000){ //'Badakhshan, Sare Kotal'
      //AppLocalizations.of(context).translate('s8')
      print("test");
      macValue = 'A4:CF:12:B4:ED:F1';
      latitude = 36.96944;
      longitude = 70.35111;
      networkHelperAW = NetworkHelper('https://api.ambientweather.net/v1/devices/$macValue?apiKey=$apiKeyAW&applicationKey=$applicationKeyAW&endDate=&limit=10');
      networkHelperOW = NetworkHelper('https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=hourly,minutely&appid=$apiKeyOW&units=imperial');
    }
    else if(Geolocator.distanceBetween(37.00099, 70.27300, latitude, longitude) < 2000){ //'Badakhshan, Naw Abad Pingani'
      //AppLocalizations.of(context).translate('s9')
      print("test");
      macValue = 'A4:CF:12:A0:2D:F3';
      latitude = 37.00099;
      longitude = 70.27300;
      networkHelperAW = NetworkHelper('https://api.ambientweather.net/v1/devices/$macValue?apiKey=$apiKeyAW&applicationKey=$applicationKeyAW&endDate=&limit=10');
      networkHelperOW = NetworkHelper('https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=hourly,minutely&appid=$apiKeyOW&units=imperial');
    }
    else if(Geolocator.distanceBetween(35.913199, -79.05584, latitude, longitude) < 2000){ //'Chapel Hill, USA'
      //AppLocalizations.of(context).translate('s10')
      print("Chapel Hill");
      macValue = '3C:71:BF:3E:A2:C0';
      latitude = 35.913199;
      longitude = -79.05584;
      networkHelperAW = NetworkHelper('https://api.ambientweather.net/v1/devices/$macValue?apiKey=$apiKeyAW&applicationKey=$applicationKeyAW&endDate=&limit=10');
      networkHelperOW = NetworkHelper('https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=hourly,minutely&appid=$apiKeyOW&units=imperial');
    }
    else
      networkHelperOW = NetworkHelper('https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=hourly,minutely&appid=$apiKeyOW&units=imperial');

//    weatherDataAW = await networkHelperAW.getData();
//    weatherDataOW = await networkHelperOW.getData();

    try {
      weatherDataAW = await networkHelperAW.getData();
      weatherDataOW = await networkHelperOW.getData();
    } on Exception catch (_) {
      print('EXCEPTION FOUND');
      weatherDataOW = await networkHelperOW.getData();
    } on Error catch (_){
      print('Error FOUND');
      weatherDataOW = await networkHelperOW.getData();
    }
    //weatherDataOW = await networkHelperOW.getData();
    TimeHelper timeHelper = TimeHelper(timeZ);
    var timeData = await timeHelper.setup();
//    if(weatherDataAW[0] == null || weatherDataAW == null || weatherDataAW == 0 || weatherDataAW[0] == 0)
//      print('ASDFGHJ');


    try {
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return Today(
            weather: weatherDataAW,
            weatherOW: weatherDataOW,
            time: timeData,
            longitude: longitude,
            latitude: latitude
        );
      }));
    } on Exception catch (_) {
      print('EXCEPTION FOUND WHEN NAVIGATING');
      Toast.show(AppLocalizations.of(context).translate('s12'), context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    } on Error catch (_){
      print('Error FOUND WHEN NAVIGATING');
      Toast.show(AppLocalizations.of(context).translate('s12'), context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    }


//    try {
//      if(weatherDataAW[0] == null || weatherDataAW == null || weatherDataAW == 0 || weatherDataAW[0] == 0){
//        //Toast.show(AppLocalizations.of(context).translate('s12'), context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
//        //weatherDataAW = 0;
//        Navigator.push(context, MaterialPageRoute(builder: (context){
//          return Today(
//              weather: weatherDataAW,
//              weatherOW: weatherDataOW,
//              time: timeData,
//              longitude: longitude,
//              latitude: latitude
//          );
//        }));
//        print("WORKED");
//      }
//      else{
//        Navigator.push(context, MaterialPageRoute(builder: (context){
//          return Today(
//              weather: weatherDataAW,
//              weatherOW: weatherDataOW,
//              time: timeData,
//              longitude: longitude,
//              latitude: latitude
//          );
//        }));
//      }
//    } on Exception catch (_) {
//      Toast.show(AppLocalizations.of(context).translate('s12'), context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
//    } on Error catch (_){
//      Toast.show(AppLocalizations.of(context).translate('s12'), context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
//    }

  }


    /*
    if((latitude >= 31.62887 && latitude <= 32.62887) && (longitude >= 65.73717 && longitude <= 66.73717)){  //'Kandahar, Mohammad Akram'
      //AppLocalizations.of(context).translate('s4')
      print("test");
      macValue = '84:F3:EB:54:51:76';
      lat = '31.62887';
      lon = '65.73717';
      networkHelperAW = NetworkHelper('https://api.ambientweather.net/v1/devices/$macValue?apiKey=$apiKeyAW&applicationKey=$applicationKeyAW&endDate=&limit=288');
      networkHelperOW = NetworkHelper('https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=hourly,minutely&appid=$apiKeyOW&units=metric');
    }
    else if((latitude >= 33.50257 && latitude <= 34.50257) && (longitude >= 67.95503 && longitude <= 68.95503)){  //'Panjshir, Big Mohammad Khil'
      //AppLocalizations.of(context).translate('s5')
      print("test");
      macValue = '84:F3:EB:54:50:54';
      lat = '35.50257';
      lon = '69.95503';
      networkHelperAW = NetworkHelper('https://api.ambientweather.net/v1/devices/$macValue?apiKey=$apiKeyAW&applicationKey=$applicationKeyAW&endDate=&limit=288');
      networkHelperOW = NetworkHelper('https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=hourly,minutely&appid=$apiKeyOW&units=metric');
    }
    else if((latitude >= 35.55534 && latitude <= 36.55534) && (longitude >= 69.95503 && longitude <= 70.95503)){  //'Kabul, World Bank'
      //AppLocalizations.of(context).translate('s6')
      print("test");
      macValue = '3C:71:BF:3E:A6:17';
      lat = '34.55534';
      lon = '69.20748';
      networkHelperAW = NetworkHelper('https://api.ambientweather.net/v1/devices/$macValue?apiKey=$apiKeyAW&applicationKey=$applicationKeyAW&endDate=&limit=288');
      networkHelperOW = NetworkHelper('https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=hourly,minutely&appid=$apiKeyOW&units=metric');
    }
    else if((latitude >= 37.55534 && latitude <= 38.55534) && (longitude >= 71.95503 && longitude <= 72.95503)){  //'Badakhshan, Qaragh Awal'
      //AppLocalizations.of(context).translate('s7')
      print("test");
      macValue = 'A4:CF:12:A0:2D:77';
      lat = '36.73477';
      lon = '70.81199';
      networkHelperAW = NetworkHelper('https://api.ambientweather.net/v1/devices/$macValue?apiKey=$apiKeyAW&applicationKey=$applicationKeyAW&endDate=&limit=288');
      networkHelperOW = NetworkHelper('https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=hourly,minutely&appid=$apiKeyOW&units=metric');
    }
    else if((latitude >= 39.55534 && latitude <= 40.55534) && (longitude >= 73.95503 && longitude <= 74.95503)){ //'Badakhshan, Sare Kotal'
      //AppLocalizations.of(context).translate('s8')
      print("test");
      macValue = 'A4:CF:12:B4:ED:F1';
      lat = '36.96944';
      lon = '70.35111';
      networkHelperAW = NetworkHelper('https://api.ambientweather.net/v1/devices/$macValue?apiKey=$apiKeyAW&applicationKey=$applicationKeyAW&endDate=&limit=288');
      networkHelperOW = NetworkHelper('https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=hourly,minutely&appid=$apiKeyOW&units=metric');
      //03
    }
    else if((latitude >= 41.55534 && latitude <= 42.55534) && (longitude >= 75.95503 && longitude <= 76.95503)){ //'Badakhshan, Naw Abad Pingani'
      //AppLocalizations.of(context).translate('s9')
      print("test");
      macValue = 'A4:CF:12:A0:2D:F3';
      lat = '37.00099';
      lon = '70.27300';
      networkHelperAW = NetworkHelper('https://api.ambientweather.net/v1/devices/$macValue?apiKey=$apiKeyAW&applicationKey=$applicationKeyAW&endDate=&limit=288');
      networkHelperOW = NetworkHelper('https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=hourly,minutely&appid=$apiKeyOW&units=metric');
      //02
    }
    else if((latitude >= 35.913199 && latitude <= 36.913199) && (longitude >= -79.05584 && longitude <= -79.05584)){ //'Chapel Hill, USA'
      //AppLocalizations.of(context).translate('s10')
      print("Chapel Hill");
      macValue = '3C:71:BF:3E:A2:C0';
      lat = '35.913199';
      lon = '-79.05584';
      networkHelperAW = NetworkHelper('https://api.ambientweather.net/v1/devices/$macValue?apiKey=$apiKeyAW&applicationKey=$applicationKeyAW&endDate=&limit=288');
      networkHelperOW = NetworkHelper('https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=hourly,minutely&appid=$apiKeyOW&units=metric');
    }
    else
      networkHelperOW = NetworkHelper('https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=hourly,minutely&appid=$apiKeyOW&units=metric');

    try {
      weatherDataAW = await networkHelperAW.getData();
      weatherDataOW = await networkHelperOW.getData();
    } on Exception catch (_) {
      weatherDataOW = await networkHelperOW.getData();
    } on Error catch (_){
      weatherDataOW = await networkHelperOW.getData();
    }



    try {
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return Today(
            weather: weatherDataAW,
            weatherOW: weatherDataOW
        );
      }));
    } on Exception catch (_) {
      Toast.show(AppLocalizations.of(context).translate('s12'), context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    } on Error catch (_){
      Toast.show(AppLocalizations.of(context).translate('s12'), context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    }
  }
  */

  /*
  String dropdownValue; //communities
  String selectionValue;
  String dropdownValue2; //languages
  String selectionValue2;
  Locale _temp;

   */
/*
  void getData(String valueWS) async {
    String macValue;
    String lat;
    String lon;
    String timeZ;


    if(valueWS == AppLocalizations.of(context).translate('s4')){  //'Kandahar, Mohammad Akram'
      macValue = '84:F3:EB:54:51:76';
      lat = '31.62887';
      lon = '65.73717';
      timeZ = 'Asia/Kabul';
    }
    else if(valueWS == AppLocalizations.of(context).translate('s5')){  //'Panjshir, Big Mohammad Khil'
      macValue = '84:F3:EB:54:50:54';
      lat = '35.50257';
      lon = '69.95503';
      timeZ = 'Asia/Kabul';
    }
    else if(valueWS == 'MRRD'){ //this WS is not up
      macValue = 'A4:CF:12:B4:ED:F1';
      lat = '34.47179';
      lon = '69.11896';
      timeZ = 'Asia/Kabul';
    }
    else if(valueWS == AppLocalizations.of(context).translate('s6')){  //'Kabul, World Bank'
      macValue = '3C:71:BF:3E:A6:17';
      lat = '34.55534';
      lon = '69.20748';
      timeZ = 'Asia/Kabul';
    }
    else if(valueWS == AppLocalizations.of(context).translate('s7')){  //'Badakhshan, Qaragh Awal'
      macValue = 'A4:CF:12:A0:2D:77';
      lat = '36.73477';
      lon = '70.81199';
      timeZ = 'Asia/Kabul';
    }
    else if(valueWS == AppLocalizations.of(context).translate('s8')){ //'Badakhshan, Sare Kotal'
      macValue = 'A4:CF:12:B4:ED:F1';
      lat = '36.96944';
      lon = '70.35111';
      timeZ = 'Asia/Kabul';
      //03
    }
    else if(valueWS == AppLocalizations.of(context).translate('s9')){ //'Badakhshan, Naw Abad Pingani'
      macValue = 'A4:CF:12:A0:2D:F3';
      lat = '37.00099';
      lon = '70.27300';
      timeZ = 'Asia/Kabul';
      //02
    }
    else if(valueWS == AppLocalizations.of(context).translate('s10')){ //'Chapel Hill, USA'
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
        Toast.show(AppLocalizations.of(context).translate('s12'), context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
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
      Toast.show(AppLocalizations.of(context).translate('s12'), context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    } on Error catch (_){
      Toast.show(AppLocalizations.of(context).translate('s12'), context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    }
  }
*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Styles.header1Color,
            body: SafeArea(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0,20.0,0.0,10.0),
                      child: Text(                                                                   //name of the App
                        AppLocalizations.of(context).translate('s1'),
                        style:TextStyle(
                          fontFamily: 'SourceSansPro-SemiBold',
                          fontSize: 35.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Image.asset('assets/images/startScr.png',width: 200,height: 200),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50.0,15.0,10.0,10.0),
                      child: Row(
                        children: <Widget>[
                          Text(                                                                   //name of the App
                            AppLocalizations.of(context).translate('s94'),
                            style:TextStyle(
                              fontFamily: 'SourceSansPro-SemiBold',
                              fontSize: 25.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10.0,0.0,0.0,0.0),
                            child: Icon(Icons.sort_by_alpha, color: Colors.white,size:40),
                          )
                        ],
                      ),
                    ),
                    /*
                    Container(
                        color: Colors.white,
                        width: 300.0,
                        height: 35.0,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          isDense: true,
                          icon: Icon(Icons.arrow_drop_down),
                          value: dropdownValue2,
                          //value: AppLocalizations.of(context).translate('s4'),
                          iconSize: 35,
                          elevation: 16,
                          style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'SourceSansPro-SemiBold'),
                          onChanged: (String newLanguage) {
                            setState(() {
                              getLocation();
                              dropdownValue2 = newLanguage;
                              selectionValue2 = newLanguage;
                              print(selectionValue2);
                              switch(newLanguage){
                                case 'ترجمه دری':
                                  _temp = Locale('da', '');
                                  break;

                                case 'پښتو ژباړه':
                                  _temp = Locale('pa', '');
                                  break;

                                case 'English':
                                  _temp = Locale('en', '');
                                  break;

                                default:
                                  _temp = Locale('da', '');
                              }
                              App.setLocale(context, _temp);
                            });
                          },
                          items: <String>['ترجمه دری','پښتو ژباړه','English']
                              .map<DropdownMenuItem<String>>((String languageValue) {
                            //dropdownValue = AppLocalizations.of(context).translate('s4');
                            return DropdownMenuItem<String>(
                              value: languageValue,
                              child: Text(languageValue),
                            );
                          }).toList(),
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0,30.0,10.0,10.0),
                      child: Text(                                                                   //name of the App
                        AppLocalizations.of(context).translate('s2'),
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
                          //value: AppLocalizations.of(context).translate('s4'),
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
                          items: <String>[AppLocalizations.of(context).translate('s4'), AppLocalizations.of(context).translate('s5'), AppLocalizations.of(context).translate('s6'),AppLocalizations.of(context).translate('s7'),AppLocalizations.of(context).translate('s8'),AppLocalizations.of(context).translate('s9'),AppLocalizations.of(context).translate('s10')]
                              .map<DropdownMenuItem<String>>((String value) {
                                //dropdownValue = AppLocalizations.of(context).translate('s4');
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )
                    ),

                     */
                    Container(
                      //padding: EdgeInsets.all(0.0),
                      margin: const EdgeInsets.fromLTRB(50.0,0.0,50.0,0.0),
                      //alignment: Alignment.center,
                      color: Colors.white,
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text(AppLocalizations.of(context).translate('s95') + ' (Default)'),
                            leading: Radio(
                              value: SingingCharacter.English,
                              groupValue: _character,
                              onChanged: (SingingCharacter value) {
                                setState(() {
                                  _character = value;
                                  _temp = Locale('en', '');
                                  App.setLocale(context, _temp);
                                  selectionValue = AppLocalizations.of(context).translate('s9');
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text(AppLocalizations.of(context).translate('s96')),
                            leading: Radio(
                              value: SingingCharacter.Dari,
                              groupValue: _character,
                              onChanged: (SingingCharacter value) {
                                setState(() {
                                  _character = value;
                                  _temp = Locale('da', '');
                                  App.setLocale(context, _temp);
                                  selectionValue = AppLocalizations.of(context).translate('s6');

                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text(AppLocalizations.of(context).translate('s97')),
                            leading: Radio(
                              value: SingingCharacter.Pashto,
                              groupValue: _character,
                              onChanged: (SingingCharacter value) {
                                setState(() {
                                  _character = value;
                                  _temp = Locale('pa', '');
                                  App.setLocale(context, _temp);
                                  selectionValue = AppLocalizations.of(context).translate('s6');
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),                                                     //Button to go to the today screen
                    RaisedButton(
                      color: Styles.btn1Color,
                      textColor: Colors.white,
                      child: Text(
                        AppLocalizations.of(context).translate('s11'),
                        style: TextStyle(fontSize: 24), textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        getLocationData();
                        //getData(selectionValue);
                        //getData();
                      },
                    ),
                  ],
                ),
              ),
            )
        )
    );
  }
}
