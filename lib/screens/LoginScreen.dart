import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:prueba_2/screens/CuentaScreen.dart';
import 'package:prueba_2/screens/RegistroScreen.dart';
void main() {
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

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
          title: const Text("Login", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.amber[900],
        ),
        body: Cuerpo(context),
    );
}
}

Widget Cuerpo(context){
  return Container(
    padding: EdgeInsets.all(15),
     decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://img.freepik.com/free-vector/paper-style-white-monochrome-background_52683-66443.jpg"),
              fit: BoxFit.cover)),
    child: (
      Column(
        children: <Widget>[
           Text("Login", style: TextStyle(fontSize: 20),),
           SizedBox(height: 30.0),
           CampoCorreo(context),
           SizedBox(height: 20.0),
           CampoContrasenia(context),
           SizedBox(height: 30.0),
           BotonLogin(context),
           SizedBox(height: 20.0),
           BotonRegistro(context)
        ],
      )
    ),
  );
}

final TextEditingController _correo = TextEditingController();
final TextEditingController _contrasenia = TextEditingController();


Widget CampoCorreo(context){
return(
 TextField(
    controller: _correo,
      decoration: InputDecoration(
        hintText: "Ingrese correo"),)
);
}

Widget CampoContrasenia(context){
return(
 TextField(
    controller: _contrasenia,
    obscureText: true,
      decoration: InputDecoration(
        hintText: "Ingrese contraseña"),)
);
}

Widget BotonLogin(context){
  return(
    FilledButton(onPressed: (){
      
       login(context);
    }, child: Text("Login"))
  );
}
Widget BotonRegistro(context){
  return(
    ElevatedButton(onPressed: (){
      Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Registro()),
              );
    }, child: Text("Registro"))
  );
}
void login(context) async{
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _correo.text,
    password: _contrasenia.text,
    
  );
  //////////////////////////////////////////////////////////
     Navigator.push(context, 
      MaterialPageRoute(builder: (context)=>Cuenta()));
    //////////////////////////////////////////////////////////
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
    
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
    
  }else{
    alerta01(context);
  }
}
}
void alerta01(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Error"),
        content: const Text("Las credenciales ingresadas son incorrectas"),
        actions: [
          
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}