import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:intl/intl.dart';

class TimeHelper{

  TimeHelper(this.timeZone);
  final String timeZone;

  Future setup() async {

    tz.initializeTimeZones();
    var wsTime = new tz.TZDateTime.from(DateTime.now(), tz.getLocation(timeZone));
    return wsTime;
    /*
    var dateConverted = (DateFormat('EEEE d MMM, yyyy').format(wsTime));
    print(dateConverted);
    return dateConverted;
     */
  }
}