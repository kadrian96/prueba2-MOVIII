import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prueba_2/screens/LoginScreen.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Prueba());
}

class Prueba extends StatelessWidget {
  const Prueba({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Prueba", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.amber[900],
        ),
        body: Cuerpo(context),
    );
}
}

Widget Cuerpo(context){
  return Container(
    width: double.infinity,
     decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://images.pexels.com/photos/3255761/pexels-photo-3255761.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
              fit: BoxFit.cover)),

    child: (
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Nombre: ", style: TextStyle(
                color: Colors.indigo,
                fontSize: 20,
                fontWeight: FontWeight.bold),
               
                
                ),
              Text("Kevin Martinez", style: TextStyle(
                fontSize: 20,
              ),
              
              ),
            ],
          ),
          SizedBox(height: 20.0),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Usuario Github: ", style: TextStyle(
                color: Colors.indigo,
                fontSize: 20,
                fontWeight: FontWeight.bold),
                ),
              Text("kadrian96", style: TextStyle(
                fontSize: 20,),)
            ],
          ),
          SizedBox(height: 30.0),
          BotonLogin(context)
        ],
      )
    ),
  );
}

Widget BotonLogin(context) {
  return(
    FilledButton(onPressed: (){
         Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );

    }, child: Text("Login"))
  );
}