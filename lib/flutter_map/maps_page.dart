import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  double latitude = -6.357518;
  double longitude =107.308700;
  double zoom = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Map"),
      ),
      body: Container(
        width: double.infinity,
        child: FlutterMap(
          options: MapOptions(
            initialZoom: zoom,
            initialCenter: LatLng(latitude, longitude),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(latitude, longitude), 
                  child: const Icon(
                    Icons.man_3_sharp,
                    color: Colors.red,
                    size: 32,
                  ),
                )
              ]
            ),
            Positioned(
              bottom: 30,
              right: 30,
              child: Column(
                children: [
                  FloatingActionButton(
                    child: const Icon(Icons.zoom_out),
                    onPressed: () {
                      setState(() {
                        zoom--;
                      });
                    }
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FloatingActionButton(
                    child: const Icon(Icons.zoom_in),
                    onPressed: () {
                      setState(() {
                        zoom++;
                      });
                    }
                  ),
                ],
              ),
            )
          ],
      ),
    ),
    );
    
    
  }
}