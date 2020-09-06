import 'package:latlong/latlong.dart';
class locationInfo{
  double _latitude;
  double _longitude;
  locationInfo(this._latitude,this._longitude);
  double getLat(){
    return _latitude;
  }
  double getLong(){
    return _longitude;
  }
}
