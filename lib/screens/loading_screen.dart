import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_now/services/location.dart';
import 'package:weather_now/services/networking.dart';
import 'package:weather_now/utilities/constants.dart';
import 'package:weather_now/utilities/reusable_card.dart';
import 'package:weather_now/services/networking.dart';
import 'package:weather_now/services/location.dart';
import 'package:weather_now/screens/location_screen.dart';

const apiKey = '2a3a36caa17423720b8be129f0ec3072';

// class LoadingScreen extends StatefulWidget {
//   @override
//   _LoadingScreenState createState() => _LoadingScreenState();
// }
//
// class _LoadingScreenState extends State<LoadingScreen> {
//   void getLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.low);
//       print(position);
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('Get weather'),
//               ElevatedButton(
//                 onPressed: () {
//                   getLocation();
//                 },
//                 child: Text('Click'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // double longitude;
  // double latitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    // latitude = location.latitude;
    // longitude = location.longitude;
    await location.getCurrentLocation();
    NetworkAPI networkAPI = NetworkAPI('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=-${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkAPI.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData,);
    }));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpinKitChasingDots(
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 20),
            Center(
              child: Text('Loading please wait...',style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
            )
          ],
        ),
      ),
    );
  }
}
