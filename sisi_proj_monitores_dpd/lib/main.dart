import 'package:flutter/material.dart';
import 'Components/Card_component.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF3D92D2)),
        useMaterial3: true,
      ),
      //const Color.fromARGB(255, 230, 37, 37),
      home: MenuPage()
    );
  }
}

class MenuPage extends StatelessWidget {
  MenuPage({super.key});


  final List<String> imageFiles = [
    'Ana.png',
    'Antonio.png',
    'Bianca.png',
    'Celiny.png',
    'Christian.png',
    'Felipe.png',
    'Heloysa.png',
    'Hyago.png',
    'Levi.png',
    'Luisa.png',
    'Luiz.png',
    'Marcos.png',
    'Marta.png',
    'Murilo.png',
    'Nicoly.png',
    'Paula.png',
    'Rafael.png',
    'Rayssa.png',
    'Regina.png',
    'Simone.png',
  ];



  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          child: Center(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageFiles.length,
              itemBuilder: (context,index){
                return Padding(padding: const EdgeInsets.all(20),
                  child: index==0? SizedBox(width: screenWidth * 0.088,) : CardComponent(img: "assets/personsForFlutter (1)/${imageFiles[index]}",nome: imageFiles[index]),
                );
              },
            )
          )
        ),
      )
    );
  }
}

