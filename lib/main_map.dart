import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

class MainMap extends StatefulWidget{
    @override
    _MainMapState createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {

    final List<Marker> markers = [
        Marker(
        point: LatLng(9.93333, -84.08333),
        width: 40,
        height: 40,
        child: Icon(Icons.location_pin, color: Colors.red, size: 40),
        ),
        Marker(
        point: LatLng( 8.53305 , -82.83844),
        width: 40,
        height: 40,
        child: Icon(Icons.location_pin, color: Colors.blue, size: 40),
        ),
    ];    
    
    void calculateDistance(){
        final Distance distance = Distance();
        double dist = distance.as(
            LengthUnit.Kilometer,
            markers[0].point,
            markers[1].point
        );

        showDialog(
            context: context,
            builder: (BuildContext context) {
                return AlertDialog(
                    title: Text("Distancia entre puntos"),
                    content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            TextField(
                                controller: TextEditingController(
                                    text: "${dist.toStringAsFixed(2)} km"
                                ),
                                readOnly: true,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Distancia en kilómetros"
                                ),
                            ),
                        ],
                    ),
                    actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Cerrar"),
                        ),
                    ],
                );
            },
        );
    }

    @override 
    Widget build( BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text("Map with Leaflet")),
            body: FlutterMap(
                options: MapOptions (
                    initialCenter: LatLng(9.93333, -84.08333),
                    initialZoom: 8.0,
                    maxZoom: 15.0,
                ),                        
                children: [
                    TileLayer(
                        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",                        
                    ),
                    MarkerClusterLayerWidget (
                        options: MarkerClusterLayerOptions(
                            maxClusterRadius: 45,
                            size: const Size(40, 40),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(50),
                            maxZoom: 15,        
                            markers: markers,
                            builder: (context, markers) {
                                return Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blue),
                                    child: Center(
                                        child: Text(
                                        markers.length.toString(),
                                        style: const TextStyle(color: Colors.white),
                                        ),
                                    ),
                                );
                            },
                        ),
                    ),
                    Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: ElevatedButton(
                            onPressed: calculateDistance,
                            child: Text("Calcular Distancia"),
                        ),
                    ),
                ],
            ),
        );
    }
}    