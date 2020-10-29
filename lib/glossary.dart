import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'styles.dart';

class Glossary extends StatefulWidget {
  @override
  _GlossaryState createState() => _GlossaryState();
}

class _GlossaryState extends State<Glossary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Glossary of Terms', style: Styles.navBarTitle)),backgroundColor: Styles.header1Color),
      body:ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Center(child: Text('Weather Measures', style: Styles.header2)),
            ),
          ),
          Card(
            child: ListTile(
              leading: SvgPicture.asset('assets/icons/currTemp.svg',color: Colors.black,height: 40,width: 40),
              title: Text('Current Temperature', style: Styles.textDefault),
              subtitle: Text('The temperature reading at the time of last update', style: TextStyle(fontSize: 16, fontFamily: 'SourceSansPro-Regular')),
            ),
          ),
          Card(
            child: ListTile(
              leading: SvgPicture.asset('assets/icons/humidity.svg',color: Colors.black,height: 35,width: 35),
              title: Text('Humidity', style: Styles.textDefault),
              subtitle: Text('Concentration percentage of water vapor present in the air', style: TextStyle(fontSize: 16, fontFamily: 'SourceSansPro-Regular')),
            ),
          ),
          Card(
            child: ListTile(
              leading: SvgPicture.asset('assets/icons/maxTemp.svg',color: Colors.black,height: 40,width: 40),
              title: Text('Maximum Temperature', style: Styles.textDefault),
              subtitle: Text('The maximum temperature reading in the last 24 hours', style: TextStyle(fontSize: 16, fontFamily: 'SourceSansPro-Regular')),
            ),
          ),
          Card(
            child: ListTile(
              leading: SvgPicture.asset('assets/icons/minTemp.svg',color: Colors.black,height: 40,width: 40),
              title: Text('Minimum Temperature', style: Styles.textDefault),
              subtitle: Text('The minimum temperature reading in the last 24 hours', style: TextStyle(fontSize: 16, fontFamily: 'SourceSansPro-Regular')),
            ),
          ),
          Card(
            child: ListTile(
              leading: SvgPicture.asset('assets/icons/precipitation.svg',color: Colors.black,height: 30,width: 30),
              title: Text('Precipitation', style: Styles.textDefault),
              subtitle: Text('The cumulative amount of rain in the last 24 hours', style: TextStyle(fontSize: 16, fontFamily: 'SourceSansPro-Regular')),
            ),
          ),
          Card(
            child: ListTile(
              leading: SvgPicture.asset('assets/icons/sunrise.svg',color: Colors.black,height: 40,width: 40),
              title: Text('Sunrise', style: Styles.textDefault),
              subtitle: Text('the time in the morning when the sun appears or full daylight arrives', style: TextStyle(fontSize: 16, fontFamily: 'SourceSansPro-Regular')),
            ),
          ),
          Card(
            child: ListTile(
              leading: SvgPicture.asset('assets/icons/sunset.svg',color: Colors.black,height: 40,width: 40),
              title: Text('Sunset', style: Styles.textDefault),
              subtitle: Text('The time in the evening when the sun disappears or daylight fades', style: TextStyle(fontSize: 16, fontFamily: 'SourceSansPro-Regular')),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.access_time, size: 36, color: Colors.black),
              title: Text('Time of Reading', style: Styles.textDefault),
              subtitle: Text('The time at which the measurement was last taken', style: TextStyle(fontSize: 16, fontFamily: 'SourceSansPro-Regular')),
            ),
          ),
          Card(
            child: ListTile(
              leading: SvgPicture.asset('assets/icons/compass.svg',color: Colors.black,height: 30,width: 30),
              title: Text('Wind Direction', style: Styles.textDefault),
              subtitle: Text('The direction the wind is coming from based on a compass reading', style: TextStyle(fontSize: 16, fontFamily: 'SourceSansPro-Regular')),
            ),
          ),
          Card(
            child: ListTile(
              leading: SvgPicture.asset('assets/icons/wind.svg',color: Colors.black,height: 30,width: 30),
              title: Text('Wind Speed', style: Styles.textDefault),
              subtitle: Text('The speed of the air at the time of measurement', style: TextStyle(fontSize: 16, fontFamily: 'SourceSansPro-Regular')),
            ),
          ),
          Card(
            child: ListTile(
              title: Center(child: Text('Weather Conditions', style: Styles.header2)),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/brokenclouds.png'),
              title: Text('Broken clouds', style: Styles.textDefault),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/clearsky.png'),
              title: Text('Clear sky', style: Styles.textDefault),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/drizzle.png'),
              title: Text('Drizzle', style: Styles.textDefault),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/mist.png'),
              title: Text('Mist', style: Styles.textDefault),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/rain.png'),
              title: Text('Rain', style: Styles.textDefault),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/scatteredclouds.png'),
              title: Text('Scattered clouds', style: Styles.textDefault),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/snow.png'),
              title: Text('Snow', style: Styles.textDefault),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/thunderstorm.png'),
              title: Text('Thunderstorm', style: Styles.textDefault),
            ),
          ),
        ],
      )
    );
  }
}
