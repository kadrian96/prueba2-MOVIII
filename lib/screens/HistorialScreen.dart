import 'package:flutter/material.dart';
void main() {
  runApp(const Historial());
}

class Historial extends StatelessWidget {
  const Historial({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Transaccion {
  final String tipo;
  final double retiro;
  final double saldo;

  Transaccion({required this.tipo, required this.retiro, required this.saldo});
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
       body: Cuerpo(),
    );
}
}
 final List<Transaccion> transacciones=[
         Transaccion(tipo: 'Compra', retiro: 150.00, saldo: 4850.00),
         Transaccion(tipo: 'Pago de Servicios', retiro: 200.00, saldo: 4650.00),
         Transaccion(tipo: 'Transferencia', retiro: 100.00, saldo: 4550.00),
    ];

Widget Cuerpo(){
  return(
      Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: transacciones.length,
          itemBuilder: (context, index) {
            final transaction = transacciones[index];
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(
                  Icons.account_balance_wallet,
                  color: Colors.blue,
                  size: 40,
                ),
                title: Text(
                  '${transaction.tipo}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  'Monto: \$${transaction.retiro.toStringAsFixed(2)}\nSaldo: \$${transaction.saldo.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            );
          },
        ),
  )
  );


}