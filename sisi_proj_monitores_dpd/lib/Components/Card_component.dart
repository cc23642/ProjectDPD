import 'package:flutter/material.dart';
import 'package:sisi_proj_monitores_dpd/Pages/Monitor_page.dart';


class CardComponent extends StatelessWidget {
  CardComponent({super.key, required this.img, required this.nome});

  final String img;
  String nome;


  static String removePrefix(String input) {
    int lastDotIndex = input.lastIndexOf('.');
    if (lastDotIndex != -1) {
      return input.substring(0, lastDotIndex);
    }
    return input; // Retorna a string original se não houver ponto
  }

  @override
  Widget build(BuildContext context) {
    nome = removePrefix(nome);
    return Center(child:
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MonitorPage(monitorName: nome),
            ),
          );
        },
        child: Container(
          height: 300,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          child: Column(
            children: [
              Image.asset(img),
              Text(
                nome,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
