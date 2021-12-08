import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cartao_padrao.dart';
import 'conteudo_icone.dart';
import 'constantes.dart';
import 'tela_resultados.dart';
import 'main.dart';

enum Sexo { masculino, feminino }

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Sexo sexoSelecionado = Sexo.masculino;
  int altura = 180;
  int peso = 60;
  int idade = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CartaoPadrao(
                    aoPressionar: () {
                      setState(() {
                        sexoSelecionado = Sexo.masculino;
                      });
                    },
                    cor: sexoSelecionado == Sexo.masculino
                        ? kCorAtivaCartaoPadrao
                        : kCorInativaCartaoPadrao,
                    filhoCartao: ConteudoIcone(
                      icone: FontAwesomeIcons.mars,
                      descricao: 'MASCULINO',
                    ),
                  ),
                ),
                Expanded(
                  child: CartaoPadrao(
                    aoPressionar: () {
                      setState(() {
                        sexoSelecionado = Sexo.feminino;
                      });
                    },
                    cor: sexoSelecionado == Sexo.feminino
                        ? kCorAtivaCartaoPadrao
                        : kCorInativaCartaoPadrao,
                    filhoCartao: ConteudoIcone(
                      icone: FontAwesomeIcons.venus,
                      descricao: 'FEMININO',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CartaoPadrao(
                cor: kCorAtivaCartaoPadrao,
                filhoCartao: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ALTURA',
                      style: kDescricaoTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          altura.toString(),
                          style: kNumeroTextStyle,
                        ),
                        Text('cm', style: kNumeroTextStyle)
                      ],
                    ),
                    Slider(
                      activeColor: Color(0xFFFF5822),
                      inactiveColor: Color(0xFF8D8E98),
                      value: altura.toDouble(),
                      onChanged: (double novoValor) {
                        setState(() {
                          altura = novoValor.round();
                        });
                      },
                      min: 120.0,
                      max: 220.0,
                    ),
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CartaoPadrao(
                    cor: kCorAtivaCartaoPadrao,
                    filhoCartao: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PESO',
                          style: kDescricaoTextStyle,
                        ),
                        Text(peso.toString(), style: kNumeroTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BotaoArredondado(
                              icone: FontAwesomeIcons.minus,
                              aoPressionar: () {
                                setState(() {
                                  peso--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            BotaoArredondado(
                              icone: FontAwesomeIcons.plus,
                              aoPressionar: () {
                                setState(() {
                                  peso++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CartaoPadrao(
                    cor: kCorAtivaCartaoPadrao,
                    filhoCartao: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'IDADE',
                          style: kDescricaoTextStyle,
                        ),
                        Text(
                          idade.toString(),
                          style: kNumeroTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BotaoArredondado(
                                icone: FontAwesomeIcons.minus,
                                aoPressionar: () {
                                  setState(() {
                                    idade--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            BotaoArredondado(
                                icone: FontAwesomeIcons.plus,
                                aoPressionar: () {
                                  setState(() {
                                    idade++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaResultados(),
                ),
              );
            },
            child: Container(
              child: Text('CALCULAR'),
              color: kCorContainerInferior,
              margin: EdgeInsets.only(top: 5.0),
              width: double.infinity,
              height: kAlturaContainerInferior,
            ),
          ),
        ],
      ),
    );
  }
}

class BotaoArredondado extends StatelessWidget {
  BotaoArredondado({required this.icone, required this.aoPressionar});

  final IconData icone;
  final aoPressionar;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icone),
      elevation: 6.0,
      onPressed: aoPressionar,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF7E7E7E),
    );
  }
}
