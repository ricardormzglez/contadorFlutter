import 'package:flutter/material.dart';




// Home screen
class ContadorScreen extends StatefulWidget {

  const ContadorScreen({Key? key}) : super(key: key);

  @override
  State<ContadorScreen> createState() => _ContadorScreenState();
}

class _ContadorScreenState extends State<ContadorScreen> {

  // Variable
  int contador = 0;

  // Función para sumar
  void contadorSuma() {
    contador++;
    setState(() {
    });
  }

  // Función para restar
  void contadorResta() {
    if (contador > 0) {
      contador--;
    } else{
      // ignore: void_checks
      return showAlertDialog(context);
    }
    setState(() {
    });
  }

  // Función para sumar
  void contadorReset() {
    contador=0;
    setState(() {
    });
  }

showAlertDialog(BuildContext context) {

  // Botón de diálogo
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () { 
      Navigator.pop(context);
    },
  );

  // Mensaje de diálogo
  AlertDialog alert = AlertDialog(
    title: const Text("Contador en 0"),
    content: const Text("El contador está en 0, no se puede restar."),
    actions: [
      okButton,
    ],
  );

  // Muestra la alerta
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

  

  @override
  Widget build(BuildContext context) {


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
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Contador', 
              style: letraEstilo), 
            Text('$contador',
              style: letraEstilo,)
            ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: botonesFlotantes(
        contadorSumaFn: contadorSuma, 
        contadorResetFn: contadorReset, 
        contadorRestaFn: contadorResta),
    );
  }
}

// ignore: camel_case_types
class botonesFlotantes extends StatelessWidget {

  final Function contadorSumaFn;
  final Function contadorResetFn;
  final Function contadorRestaFn;
  
  const botonesFlotantes({
    Key? key, required this.contadorSumaFn, 
              required this.contadorResetFn, 
              required this.contadorRestaFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
          child: const Icon( Icons.exposure_minus_1, 
                          size: 50, 
                          color: Color.fromARGB(255, 149, 195, 248)),
          onPressed: () =>
            contadorRestaFn(),
        ),
        FloatingActionButton(
          child: const Icon( Icons.restart_alt,
                          size: 50, 
                          color: Color.fromARGB(255, 149, 195, 248)),
          onPressed: () => contadorResetFn(),
        ),
        FloatingActionButton(
          child: const Icon( Icons.exposure_plus_1,
                          size: 50, 
                          color: Color.fromARGB(255, 149, 195, 248)),
          onPressed: () => contadorSumaFn(),
        ),
      ],
    );
  }
}




