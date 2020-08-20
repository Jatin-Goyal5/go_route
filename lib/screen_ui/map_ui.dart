import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocation/geolocation.dart';
class mapApi extends StatefulWidget {
  @override
  _mapApiState createState() => _mapApiState();
}

class _mapApiState extends State<mapApi> {
  Widget list_Widget(){
    return Card(

      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
               onTap: () {
                  print('Card tapped.');
                },
        child: new ListTile(
          dense: true,
          enabled: false,
          leading: Icon(Icons.local_florist,color: Colors.green,),
          title: Text("kazaranga park",
            style: TextStyle(fontStyle: FontStyle.italic,
                fontSize: 20.0,
                color: Colors.red
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
      return new Scaffold(
          body:new FlutterMap(
            options: new MapOptions(
            center: new LatLng(51.5, -0.09),
            zoom: 13.0
            ),
            layers: [
              new TileLayerOptions(
                urlTemplate: "https://api.mapbox.com/styles/v1/jatingoyal1234/cjzjkpp514cva1cqly9zt603i/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiamF0aW5nb3lhbDEyMzQiLCJhIjoiY2tlMXFramRqMDF6NjJybXNoM28zbGxjdiJ9.y8eZrBb0gEbf9E3VZXJE-A",
                additionalOptions: {
                'accessToken':'pk.eyJ1IjoiamF0aW5nb3lhbDEyMzQiLCJhIjoiY2tlMXFramRqMDF6NjJybXNoM28zbGxjdiJ9.y8eZrBb0gEbf9E3VZXJE-A',
                'id':'mapbox.mapbox-streets-v7'
                },
              ),
              new MarkerLayerOptions(
                markers: [
                  new Marker(
                    width: 80.0,
                    height: 80.0,
                    point: new LatLng(51.5, -0.09),
                    builder: (ctx) => new Container(
                      child: IconButton(
                        icon:Icon(Icons.location_on),
                          color: Colors.greenAccent,
                          iconSize: 45.0,
                        onPressed: (){
                          showModalBottomSheet(
                            context: context,
                            builder: (builder){
                              return Container(
                                child:new ListView(
                                  children: <Widget>[
                                    list_Widget(),
                                    list_Widget(),
                                    list_Widget(),
                                    list_Widget(),
                                  ],
                                ),
                            );
                            }
                            );
                          },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.location_searching),
          onPressed: (){

//            LocationResult result =  Geolocation.currentLocation();

          },
        ),
      );
  }
}


