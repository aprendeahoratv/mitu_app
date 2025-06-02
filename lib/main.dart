// NUEVOS IMPORTS PARA FIREBASE
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Asegúrate que este archivo existe después de 'flutterfire configure'

// IMPORT ORIGINAL
import 'package:flutter/material.dart';

// FUNCIÓN MAIN MODIFICADA
void main() async { // <--- Añadir 'async'
  WidgetsFlutterBinding.ensureInitialized(); // <--- Añadir esta línea
  await Firebase.initializeApp( // <--- Añadir esta línea
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp()); // Esta línea ya estaba, puede que sin 'const'
}

// El resto de tu código (MyApp, MyHomePage, etc.) sigue aquí debajo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mitu App', // Puedes cambiar el título
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), // Puedes cambiar el color
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mitu Home Page'), // Puedes cambiar el título de la página
    );
  }
}

// ... (MyHomePage y _MyHomePageState pueden quedarse o ser reemplazadas por tu primera pantalla)
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Firebase está inicializado. ¡Listo para Mitu!',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}