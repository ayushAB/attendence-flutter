import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:attendence/services/ApiService.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:geolocator/geolocator.dart';
 
import 'dart:async';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ConnectivityResult _connectionStatus = ConnectivityResult.none;
  // final Connectivity _connectivity = Connectivity();
  // late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final ApiService api = new ApiService();


  @override
  void initState() {
    super.initState();
    _determinePosition().then((data) => {
print(data)
    });
    // initConnectivity();

    // _connectivitySubscription =
    //     _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    // _connectivitySubscription.cancel();
    super.dispose();
  }

  // // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initConnectivity() async {
  //   late ConnectivityResult result;
  //   // Platform messages
  //   // may fail, so we use a try/catch PlatformException.
  //   try {
  //     result = await _connectivity.checkConnectivity();
  // ignore: unused_catch_clause
  //   } on PlatformException catch (e) {
  //     print('Couldn\'t check connectivity status');
  //     return;
  //   }

  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) {
  //     return Future.value(null);
  //   }

  //   return _updateConnectionStatus(result);
  // }

  // Future<void> _updateConnectionStatus(ConnectivityResult result) async {
  //   if (result == ConnectivityResult.wifi) {

  //     try {
  //       // var result = await api.markAttendence('');
  //       DateTime now = DateTime.now();
  //       final info = NetworkInfo();
  //       // box1.put("connectedstate", {'status': 'online', 'time': now});
  //       var wifiBSSID = await info.getWifiBSSID();
  //       var name = await info.getWifiName();
  //       var wifiIP = await info.getWifiIP();
  //       print(wifiBSSID);
      

  //       // print(result.statusCode);
  //     } catch (e) {
  //       print(e);
  //     }

  //     // make api call to our api
  //   }

  //   if (result == ConnectivityResult.none) {
  //     // api.testApi().then((value) => print(value.body));
  //     DateTime now = DateTime.now();

  //     // box1.put("disconnetedstate", {'status': 'offline', 'time': now});

  //     // print(box1.get('connectedstate'));
  //     // print(box1.get('disconnetedstate'));
    
  //     print("disconnected");
  //     // make api call to oue status with status offline
  //   }

  //   setState(() {
  //     _connectionStatus = result;
  //   });
  // }

  Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Attendence Tracker'),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              title: Text('Connection Status:slasad'),
            ),
            elevation: 8,
          ),
        )));
  }
}
