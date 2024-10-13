import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sisi_proj_monitores_dpd/Components/Table_component.dart';

class MonitorPage extends StatefulWidget {
  const MonitorPage({super.key, required this.monitorName});

  final String monitorName;

  @override
  _MonitorPageState createState() => _MonitorPageState();
}

class _MonitorPageState extends State<MonitorPage> {
  String data = '';
  Map<String, dynamic> monitor = {};

  @override
  void initState() {
    super.initState();
    fetchData(); 
  }

  void fetchData() async {
    final url = Uri.parse('http://localhost:3000/monitor/nome/${widget.monitorName}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        data = response.body;
        monitor = jsonDecode(data);
      });
    } else {
      setState(() {
        data = 'Horários não encontrados...';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.monitorName)),
      body: Center(
        child: data.isEmpty
            ? CircularProgressIndicator() 
            : TableComponent(monitor: monitor,),
      ),
    );
  }
}

