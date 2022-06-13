import 'package:flutter/material.dart';

// Home screen
class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Variable
    int contador = 10;

    const letraEstilo = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 30
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
        elevation: 10.0,
        backgroundColor: const Color.fromARGB(0, 20, 198, 230),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 39, 140, 223),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Contador', 
              style: letraEstilo), 
            Text('$contador',
              style: letraEstilo,)
            ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.add, 
                        size: 50, 
                        color: Color.fromARGB(255, 149, 195, 248)),
        onPressed: () {
          contador++;
          // print('Presionaste el botón: $contador');
        },
      ),
    );
  }

}
