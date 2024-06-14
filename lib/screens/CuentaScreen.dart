import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prueba_2/main.dart';
import 'package:prueba_2/screens/HistorialScreen.dart';
void main() {
  runApp(const Cuenta());
}

class Cuenta extends StatelessWidget {
  const Cuenta({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indice=0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [Cuerpo(context), const Historial()];
    return Scaffold(
        appBar: AppBar(
          title: const Text("Aplicacion", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.amber[900],
        ),
        body: screens[indice],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: indice,
            onTap: (valor) {
              setState(() {
                indice = valor;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Cuenta"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance), label: "Historial"),
            ])
    );
}
}

Widget Cuerpo(context){
  return Container(
    padding: const EdgeInsets.all(16.0),
    child: (
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: <Widget>[
          SizedBox(height: 40),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage("https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg"),
            ),
            SizedBox(height: 20),
            Text(
              'Número de Cuenta: 1234567890',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Total en la Cuenta: \$5,600.00',
              style: TextStyle(
                fontSize: 24,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(height: 30),
            BotonCerrarSesion(context)
        ],
      )
    ),
  );
}

Widget BotonCerrarSesion(context){
  return(
    FilledButton(onPressed: (){
      cerrarSesion();
       Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Prueba()),
              );
    }, child: Text("Cerrar Sesion"),
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.red[600])
    ),)
  );
}

Future<void> cerrarSesion() async {
  await FirebaseAuth.instance.signOut();
}