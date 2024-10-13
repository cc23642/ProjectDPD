import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TableComponent extends StatefulWidget {
  final Map<String, dynamic> monitor;

  TableComponent({Key? key, required this.monitor}) : super(key: key);

  @override
  _TableComponentState createState() => _TableComponentState();
}

class _TableComponentState extends State<TableComponent> {
  String errorMessage = '';
  
  // Lista de horários padrão
  final List<String> horarios = [
    '7:30', '8:15', '9:00', '9:45', '10:30',
    '11:15', '13:30', '14:45', '15:00',
    '15:45', '16:30', '18:15', '19:00', 
    '20:15', '21:45', '22:30'
  ];

  // Lista de dias da semana
  final List<String> diasDaSemana = ['Segunda', 'Terca', 'Quarta', 'Quinta', 'Sexta', 'Sabado'];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final url = Uri.parse('http://localhost:3000/monitor/horarios');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        // Se a API retornar uma lista de horários, você pode armazená-los aqui
        // Por exemplo:
        // horarios = List<String>.from(jsonDecode(response.body));
      });
    } else {
      setState(() {
        errorMessage = 'Horários não encontrados...';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(2),
            3: FlexColumnWidth(2),
            4: FlexColumnWidth(2),
            5: FlexColumnWidth(2),
            6: FlexColumnWidth(2),
            7: FlexColumnWidth(2),
          },
          children: [
            const TableRow(
              decoration: BoxDecoration(color: Color.fromARGB(50, 0, 102, 153)),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Nome do Monitor'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Curso'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Segunda'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Terça'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Quarta'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Quinta'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Sexta'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Sábado'),
                ),
              ],
            ),
            // Se houver erro, exiba a mensagem
            if (errorMessage.isNotEmpty)
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(errorMessage),
                  ),
                  const SizedBox(),
                  const SizedBox(),
                  const SizedBox(),
                  const SizedBox(),
                  const SizedBox(),
                  const SizedBox(),
                  const SizedBox(),
                  const SizedBox(),
                ],
              ),
            // Gerar as linhas dinamicamente
            ...diasDaSemana.map((dia) {
              return TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.monitor['nome'] ?? 'Nome do Monitor'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.monitor['curso'] ?? ''),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(horarios.join(', ')), // Exibir todos os horários
                  ),
                  // Adicione lógica aqui para mostrar horários específicos para cada dia se necessário
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(''), // Placeholder para Terça
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(''), // Placeholder para Quarta
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(''), // Placeholder para Quinta
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(''), // Placeholder para Sexta
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(''), // Placeholder para Sábado
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
