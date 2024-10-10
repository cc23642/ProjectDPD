import 'package:flutter/material.dart';

class MonitorPage extends StatelessWidget{

  MonitorPage({super.key, required this.monitorName});

  final String monitorName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(monitorName)),

      
    );
  }


}