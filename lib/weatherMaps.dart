import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/options.dart';
import 'package:weatherapp/forecast.dart';
import 'package:weatherapp/today.dart';
import 'styles.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class WeatherMaps extends StatefulWidget{
  WeatherMaps({this.weather,this.weatherOW,this.time,this.longitude,this.latitude});
  final weather;
  final weatherOW;
  final time;
  final longitude;
  final latitude;

  @override
  _WeatherMapsState createState() => _WeatherMapsState(); //this is a comment
}
class _WeatherMapsState extends State<WeatherMaps>{

  double lat;
  double lon;
  var mapURL;
  var awData;
  var owData;
  var tzData;

  @override
  void initState(){
    super.initState();
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
    awData = weather;
  }

  @override
  Widget build(BuildContext context) {
    //final _scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        //title: Center(child: Text('${dateConverter(tzData)}', style: Styles.navBarTitle)),
        title: Center(child: Text('Weather Maps', style: Styles.navBarTitle)),
        backgroundColor: Styles.header1Color,
      ),
      body: new FlutterMap(
        options: new MapOptions(
          center: new LatLng(lat,lon),//new LatLng(51.5, -0.09),
          zoom: 5.0,
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
                IconButton(
                  icon: Icon(Icons.person_pin_circle, size: 50),
                  onPressed: (){
                    showModalBottomSheet(
                        context: context,
                        builder: (builder){
                          return Container(
                            color: Colors.white,
                            child: Center(
                              child: Text("Info About the weather Map/WeatherMap toggle"),
                            ),
                          );
                        }
                    );
                  },
                ),
                //Icon(Icons.person_pin_circle, size: 50)
              ),
            ),
          ],
        ),
        ],
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