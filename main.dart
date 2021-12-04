import 'package:flutter/material.dart';

const alturaContainerInferior = 80.0;
const corAtivaCartaoPadrao = Color(0xFF9E9E9E);
const corContainerInferior = Color(0xFFFF5822);

void main() => runApp(CalculadoraIMC());

class CalculadoraIMC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          // ignore: deprecated_member_use
          ThemeData.dark().copyWith(
        primaryColor: Color(0xFF616161),
        scaffoldBackgroundColor: Color(0xFF616161),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      home: TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULADORA IMC'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CartaoPadrao(cor: corAtivaCartaoPadrao),
                ),
                Expanded(
                  child: CartaoPadrao(cor: corAtivaCartaoPadrao),
                ),
              ],
            ),
          ),
          Expanded(
            child: CartaoPadrao(cor: corAtivaCartaoPadrao),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CartaoPadrao(cor: corAtivaCartaoPadrao),
                ),
                Expanded(
                  child: CartaoPadrao(cor: corAtivaCartaoPadrao),
                ),
              ],
            ),
          ),
          Container(
            color: corContainerInferior,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: alturaContainerInferior,
          )
        ],
      ),
    );
  }
}

class CartaoPadrao extends StatelessWidget {
  CartaoPadrao(
      {required this.cor}); //as chaves servem para especializar atributos como cor e não deixar padrão

  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
