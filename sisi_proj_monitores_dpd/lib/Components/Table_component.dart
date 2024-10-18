import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TableComponent extends StatefulWidget {
  final Map<String, dynamic> monitor;

  TableComponent({Key? key, required this.monitor}) : super(key: key);

  @override
  _TableComponentState createState() => _TableComponentState(monitor: this.monitor);
}

class _TableComponentState extends State<TableComponent> {
  
  Map<String, dynamic> monitor;

  _TableComponentState({required this.monitor});
  
  // Lista de horários padrão
  final List<String> todos_horarios = [
    '7:30', '8:15', '9:00', '9:45', '10:30',
    '11:15', '13:30', '14:45', '15:00',
    '15:45', '16:30', '18:15', '19:00', 
    '20:15', '21:45', '22:30'
  ];

  // Lista de dias da semana
  final List<String> diasDaSemana = ['Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'];


  @override
  void initState() {
    super.initState();
  }

  int max() {
    int numMax = 3;
    Map<String, dynamic> horarios = monitor['horarios'];

    
    horarios.forEach((key, value) {
      if (value.length > numMax) {
        numMax = value.length;
      }
    });

    return numMax;
  }


  @override
Widget build(BuildContext context) {

  int maxHorarios = max();

  return Padding(
    padding: const EdgeInsets.all(50),
    child: SingleChildScrollView(
      child: Table(
        border: const TableBorder(
          verticalInside: BorderSide(width: 1.0),
          horizontalInside: BorderSide(width: 1.0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        columnWidths: const {
          0: FlexColumnWidth(2),
        },
        children: [
          ...monitor['horarios'].entries.map((dia) {
            return TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(dia.key ?? "data"),
                ),
                ...dia.value.map((hora) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(hora ?? ""),
                  );
                }).toList(),
                for (int i = dia.value.length; i < maxHorarios; i++)
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(""), // Célula vazia
                  ),
              ],
            );
          }).toList(),
        ],

      ),
    ),
  );
}

}
