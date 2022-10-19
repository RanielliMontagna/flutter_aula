import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sobre'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //imagem redonda
              const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/fotoPerfil.jpg'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Sobre mim',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Info(title: 'Nome:', text: 'Ranielli Montagna'),
              Info(title: 'Matrícula:', text: '182746'),
              Info(title: 'Email:', text: 'ranielimontagna@hotmail.com'),
              Info(title: 'Curso:', text: 'ADS'),
              Info(title: 'Semestre:', text: '6º'),

              //button para site
              const SizedBox(
                height: 20,
              ),

              ElevatedButton(
                onPressed: () {
                  var uri = Uri.parse('https://ranimontagna.com');
                  launchUrl(uri);
                },
                child: const Text('Para mais informações clique aqui'),
              ),
            ],
          ),
        ));
  }
}

// ignore: must_be_immutable
class Info extends StatelessWidget {
  var title = '';
  var text = "";

  Info({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            //padding left e right
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            )),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
