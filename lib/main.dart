import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var mensaje = "Titulo de la Aplicacion";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(
          title: mensaje, edad: 20, nombre: "Alex Vacca", cedula: "1001"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final String cedula;
  final String nombre;
  final int edad;
  const MyHomePage(
      {super.key,
      required this.title,
      required this.cedula,
      required this.nombre,
      required this.edad});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter(String op) {
    switch (op) {
      case '+':
        _counter++;
        break;
      case '-':
        (_counter > 0) ? _counter-- : 0;
        break;
      case '0':
        _counter = 0;
        break;
      default:
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 179, 90, 0.9),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'Contador: ',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter("-");
                    },
                    child: const Text("Restar")),
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter("0");
                    },
                    child: const Text("Reset")),
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter("+");
                    },
                    child: const Text("Sumar")),
              ],
            ),
            Text("Nombre:${widget.nombre}"),
            Text("Cedula:${widget.cedula}"),
            Text("Edad:${widget.edad}"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter("+");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
