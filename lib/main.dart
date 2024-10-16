import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Level Sensor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
    
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final MapController mapController = MapController();
    const LatLng initialCenter = LatLng(10.2475518, 105.3242644);
    double zoom = 5.5;

    return Scaffold(
      appBar: AppBar(
  
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: const Text("Water Level Sensor"),
      ),
      body:  Center(
        child: FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: initialCenter,
              initialZoom: zoom,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://maps.becagis.vn/tiles/basemap/light/{z}/{x}/{y}.png',
                userAgentPackageName: 'irri.intern.soilnutrientmap',
              ),
            ],
          ),
        ),
    );
  }
}
