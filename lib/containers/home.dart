import 'package:app_aula/containers/maisinfo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(
                    image: AssetImage('assets/upfblack.png'),
                    width: 130,
                    height: 130,
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
              leading: const Icon(Icons.home),
            ),
            ListTile(
              title: const Text('Sobre'),
              onTap: () {
                Navigator.pushNamed(context, '/sobre');
              },
              leading: const Icon(Icons.info),
            ),
            ListTile(
              title: const Text('Contador'),
              onTap: () {
                Navigator.pushNamed(context, '/contador');
              },
              leading: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Image(
                image: AssetImage('assets/upf.png'), width: 200, height: 200),
            const Text(
              'Bem vindos',
              style: TextStyle(fontSize: 28),
            ),
            const Text(
              'Aula de Flutter',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sobre');
              },
              child: const Text('Sobre'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/contador');
              },
              child: const Text('Contador'),
            ),
            ElevatedButton(
              child: const Text('Mais Informações'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MaisInfoPage(
                      valor: 'Dados passados para a tela de mais informações',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
