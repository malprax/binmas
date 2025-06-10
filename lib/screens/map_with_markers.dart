import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';

class MapWithMarkers extends StatefulWidget {
  const MapWithMarkers({super.key});

  @override
  State<MapWithMarkers> createState() => _MapWithMarkersState();
}

class _MapWithMarkersState extends State<MapWithMarkers> {
  final PopupController _popupController = PopupController();

  final List<Marker> markers = [
    Marker(
      point: LatLng(-5.147665, 119.432732),
      width: 40,
      height: 40,
      child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
    ),
    Marker(
      point: LatLng(-5.147, 119.433),
      width: 40,
      height: 40,
      child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
    ),
  ];

  final List<String> names = ['Pak Arman - ORW 5', 'Bu Siti - ORW 7'];

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(-5.1475, 119.4330),
        zoom: 16,
        onTap: (_, __) => _popupController.hideAllPopups(),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.binmasorw',
        ),
        PopupMarkerLayerWidget(
          options: PopupMarkerLayerOptions(
            markers: markers,
            popupController: _popupController,
            popupBuilder: (BuildContext context, Marker marker) {
              final index = markers.indexOf(marker);
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(names[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
