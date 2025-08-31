import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Listado de Lenguajes de programación',
      home: MyHomePage(title: 'Lenguajes de programación'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // 0: Lenguajes, 1: Cards

  final List<Map<String, String>> languages = [
    {
      'name': 'Dart',
      'image': 'assets/img/Dart.jpg',
      'desc': 'Lenguaje optimizado para apps móviles y web.',
    },
    {
      'name': 'Python',
      'image': 'assets/img/python.jpg',
      'desc': 'Popular para ciencia de datos y automatización.',
    },
    {
      'name': 'Java',
      'image': 'assets/img/Java.png',
      'desc': 'Robusto y usado en aplicaciones empresariales.',
    },
    {
      'name': 'C++',
      'image': 'assets/img/C++.jpg',
      'desc': 'Potente para sistemas y videojuegos.',
    },
    {
      'name': 'JavaScript',
      'image': 'assets/img/Javascript.webp',
      'desc': 'Esencial para desarrollo web.',
    },
    {
      'name': 'Rust',
      'image': 'assets/img/Rust.jpg',
      'desc': 'Moderno, seguro y rápido.',
    },
    {
      'name': 'Swift',
      'image': 'assets/img/Swift-Logo.jpg',
      'desc': 'Lenguaje de Apple para iOS y macOS.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Selecciona tu lenguaje de programación favorito.'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: _selectedIndex == 0
          ? ListView.builder(
              itemCount: languages.length,
              itemBuilder: (context, index) {
                final lang = languages[index];
                return ListTile(
                  leading: Image.asset(
                    lang['image']!,
                    width: 40,
                    height: 40,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.code),
                  ),
                  title: Text(lang['name']!),
                );
              },
            )
          : ListView.builder(
              itemCount: languages.length,
              itemBuilder: (context, index) {
                final lang = languages[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.asset(
                      lang['image']!,
                      width: 40,
                      height: 40,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.code),
                    ),
                    title: Text(lang['name']!),
                    subtitle: Text(lang['desc']!),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(lang['name']!),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                lang['image']!,
                                width: 80,
                                height: 80,
                                errorBuilder: (context, error, stackTrace) => const Icon(Icons.code, size: 80),
                              ),
                              const SizedBox(height: 10),
                              Text(lang['desc']!),
                            ],
                          ),
                          actions: [
                            TextButton(
                              child: const Text('Cerrar'),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                image: DecorationImage(
                  image: AssetImage('assets/img/Logo.jpeg'),
                  fit: BoxFit.cover,
                  opacity: 0.3,
                ),
              ),
              child: const Text(
                'Opciones',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Lenguajes'),
              selected: _selectedIndex == 0,
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.view_module),
              title: const Text('Vista Cards'),
              selected: _selectedIndex == 1,
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}