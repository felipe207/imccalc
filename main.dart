import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cartao_padrao.dart';
import 'conteudo_icone.dart';

const alturaContainerInferior = 40.0;
const corAtivaCartaoPadrao = Color(0xFF9E9E9E);
const corInativaCartaoPadrao = Color(0xFF7E7E7E);
const corContainerInferior = Color(0xFFFF5822);

enum Sexo { masculino, feminino }

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
  //como essa é uma classe estate não precisamos colocar o final
  Color corMasculinoCartaoPadrao = corInativaCartaoPadrao;
  Color corFemininoCartaoPadrao = corInativaCartaoPadrao;

//1 = MASCULINO, 2 = FEMININO
  void atualizarCor(Sexo sexoSelecionado) {
    if (sexoSelecionado == Sexo.masculino) {
      if (corMasculinoCartaoPadrao == corInativaCartaoPadrao) {
        corMasculinoCartaoPadrao = corAtivaCartaoPadrao;
        corFemininoCartaoPadrao = corInativaCartaoPadrao;
      } else {
        corMasculinoCartaoPadrao = corInativaCartaoPadrao;
      }
    }

    if (sexoSelecionado == Sexo.feminino) {
      if (corFemininoCartaoPadrao == corInativaCartaoPadrao) {
        corFemininoCartaoPadrao = corAtivaCartaoPadrao;
        corMasculinoCartaoPadrao = corInativaCartaoPadrao;
      } else {
        corFemininoCartaoPadrao = corInativaCartaoPadrao;
      }
    }
  }

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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        atualizarCor(Sexo.masculino);
                      });
                    },
                    child: CartaoPadrao(
                      cor: corMasculinoCartaoPadrao,
                      filhoCartao: ConteudoIcone(
                        icone: FontAwesomeIcons.mars,
                        descricao: 'MASCULINO',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        atualizarCor(Sexo.feminino);
                      });
                    },
                    child: CartaoPadrao(
                      cor: corFemininoCartaoPadrao,
                      filhoCartao: ConteudoIcone(
                        icone: FontAwesomeIcons.venus,
                        descricao: 'FEMININO',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CartaoPadrao(
              cor: corAtivaCartaoPadrao,
              filhoCartao: ConteudoIcone(
                icone: FontAwesomeIcons.mars,
                descricao: 'MASCULINO',
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CartaoPadrao(
                    cor: corAtivaCartaoPadrao,
                    filhoCartao: ConteudoIcone(
                      icone: FontAwesomeIcons.mars,
                      descricao: 'MASCULINO',
                    ),
                  ),
                ),
                Expanded(
                  child: CartaoPadrao(
                    cor: corAtivaCartaoPadrao,
                    filhoCartao: ConteudoIcone(
                      icone: FontAwesomeIcons.mars,
                      descricao: 'MASCULINO',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: corContainerInferior,
            margin: EdgeInsets.only(top: 5.0),
            width: double.infinity,
            height: alturaContainerInferior,
          )
        ],
      ),
    );
  }
}
