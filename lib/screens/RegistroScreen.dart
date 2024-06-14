import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:prueba_2/screens/LoginScreen.dart';
void main() {
  runApp(const Registro());
}

class Registro extends StatelessWidget {
  const Registro({super.key});

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
          title: const Text("Registro", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.amber[900],
        ),
        body: Cuerpo(context),
    );
}
}

Widget Cuerpo(context){
  return Container(
    padding: EdgeInsets.all(10),
    decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://img.freepik.com/free-vector/paper-style-white-monochrome-background_52683-66443.jpg"),
              fit: BoxFit.cover)),
    child: (
     Column(
       children: <Widget>[
        Text("Registro", style: TextStyle(fontSize: 20),),
          SizedBox(height: 30.0),
        CampoNick(context),
        SizedBox(height: 20.0),
        CampoCorreo(context),
        SizedBox(height: 20.0),
        CampoContrasenia(context),
         SizedBox(height: 30.0),
        ButonRegistro(context)
       ],
     )
    ),
  );
}

final TextEditingController _correo = TextEditingController();
final TextEditingController _contrasenia = TextEditingController();
final TextEditingController _nickname = TextEditingController();

Widget CampoNick(context){
return(
 TextField(
    controller: _nickname,
      decoration: InputDecoration(
        hintText: "Ingrese nickname"),)
);
}

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

Widget ButonRegistro(context){
  return(
    ElevatedButton(onPressed: (){
       registro(context);
       guardar();
    }, child: Text("Registrar"))
  );
}

void registro (context) async{
  try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _correo.text,
    password: _contrasenia.text,
  );

  //////////////////////////////////////////////////////////
     Navigator.push(context, 
      MaterialPageRoute(builder: (context)=>Login()));
    //////////////////////////////////////////////////////////
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
    alerta01(context);
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
    alerta02(context);
  }
} catch (e) {
  print(e);
  alerta03(context);
}
}

Future<void> guardar() async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("usuarios/"+_nickname.text);               //doy el nombre a la coleccion en el metodo .ref y el nombre del id con el que se va a guardar

await ref.set({
  "nickname": _nickname.text,
  "correo": _correo.text,
 
});
}

void alerta01(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Error"),
        content: const Text("La contraseña es muy debil"),
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

void alerta02(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Error"),
        content: const Text("La cuenta ya existe con este correo"),
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

void alerta03(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Error"),
        content: const Text("Contacte con soporte tecnico"),
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