import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skin Cancer Classification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Skin Cancer Classification'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  XFile? imagenSeleccionada;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          const Text(
            'Selecciona una foto y espera que el modelo genere el resultado',
          ),
          TextButton(
            onPressed: () async {
              XFile? imagen =
                  await _picker.pickImage(source: ImageSource.gallery);
              setState(() {
                imagenSeleccionada = imagen;
              });
              if (imagenSeleccionada != null) {
                _showImage(imagenSeleccionada!);
              } else {}
            },
            child: const Text("Seleccionar una foto"),
          ),
          SizedBox(
            child: imagenSeleccionada != null
                ? Image.file(File(imagenSeleccionada!.path))
                : const Text("No ha seleccionado ninguna imagen"),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _showImage(XFile image) {}
}
