import 'package:contador/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cont = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Column(
          children: [
            Text("Contador"),
            SizedBox(height: 8), // Espacio entre los textos
            Text(
              "Hector Ever Alonso Ramirez",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              runApp(const MaterialApp(
              home: LoginPage(),
      ));
            },
          ),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Numero de clicks"),
          Text("$cont")
          ],
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _crearBotones(),
    );
  }

  Widget _crearBotones() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => _sumar(),
          ),
          const SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => _restar(),
          ),
          const SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            child: const Icon(Icons.exposure_zero),
            onPressed: () => _restablecer(),
          )
        ],
      ),
    );
  }

  void _sumar() {
    setState(() => cont++);
  }

  void _restar() {
    setState(() {
      if (cont == 0) {
        cont = 0;
      } else {
        cont--;
      }
    });
  }

  void _restablecer() {
    setState(() => cont = 0);
  }
}
