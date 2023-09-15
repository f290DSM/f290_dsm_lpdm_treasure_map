import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MainMap());
}

class MainMap extends StatefulWidget {
  const MainMap({super.key});

  @override
  State<MainMap> createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  List<Marker> _markers = [];
  var position =
      const CameraPosition(target: LatLng(-22.357392, -47.384776), zoom: 12);

  @override
  void initState() {
    _getCurrentLocation().then((pos) {
      addMarker(pos!, 'currpos', 'Vocês está aqui!');
    }).catchError((error) => print(error.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps'),
        ),
        body: Center(
          child: GoogleMap(
            initialCameraPosition: position,
            markers: Set<Marker>.of(_markers),
          ),
        ),
      ),
    );
  }

  Future<Position?> _getCurrentLocation() async {
    bool isGeolocationAvailable = await Geolocator.isLocationServiceEnabled();

    late Position _position;

    if (isGeolocationAvailable) {
      try {
        _position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        print('ok');
      } catch (error) {
        return _position;
      }
    }
    return _position;
  }

  void addMarker(Position pos, String markerId, String markerTitle) {
    final marker = Marker(
        markerId: MarkerId(markerId),
        position: LatLng(pos.latitude, pos.longitude),
        infoWindow: InfoWindow(
            title: markerTitle, snippet: 'Lorem ipsum dolor sit ammet...'),
        icon: (markerId == 'currpos')
            ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)
            : BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueOrange));
    _markers.add(marker);
    setState(() {
      _markers = _markers;
    });
  }
}
