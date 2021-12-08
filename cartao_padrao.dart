import 'package:flutter/material.dart';

class CartaoPadrao extends StatelessWidget {
  CartaoPadrao({required this.cor, this.filhoCartao, this.aoPressionar});
  //as chaves servem para especializar atributos como cor e não deixar padrão

  final Color cor;
  //final Widget filhoCartao;
  final filhoCartao;
  final aoPressionar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Container(
        child: filhoCartao,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
