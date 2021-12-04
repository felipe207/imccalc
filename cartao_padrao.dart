import 'package:flutter/material.dart';

class CartaoPadrao extends StatelessWidget {
  CartaoPadrao(
      {required this.cor,
      required this.filhoCartao}); //as chaves servem para especializar atributos como cor e não deixar padrão

  final Color cor;
  final Widget filhoCartao;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: filhoCartao,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
