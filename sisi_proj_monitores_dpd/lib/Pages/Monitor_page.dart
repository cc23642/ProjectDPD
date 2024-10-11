import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MonitorPage extends StatefulWidget {
  const MonitorPage({super.key, required this.monitorName});

  final String monitorName;

  @override
  _MonitorPageState createState() => _MonitorPageState();
}

class _MonitorPageState extends State<MonitorPage> {
  String data = '';
  Map<String, dynamic> monitor = {}; // Inicializa como um mapa vazio

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
        monitor = jsonDecode(data); // Decodifica o JSON aqui
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
            : Table(
                border: TableBorder.all(),
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2), 
                },
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Curso'), // Cabeçalho para o curso
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Horários'), // Cabeçalho para os horários
                      ),
                    ]
                  ),
                  // Adiciona a linha com o curso e a lista de horários
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(monitor['curso'] ?? ''), // Exibe o curso
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: (monitor['horarios'] as List<dynamic>? ?? []).map((horario) {
                            return Text(horario.toString()); // Exibe cada horário
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ]
              ),
      ),
    );
  }
}

