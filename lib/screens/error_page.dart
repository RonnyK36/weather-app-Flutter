import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error!'),
      ),
      body: Column(
        children: [
          Icon(Icons.wifi_tethering_error_rounded, color: Colors.white,size: 100,),
          Text('Please try the following:'),
        ],
      ),
    );
  }
}
