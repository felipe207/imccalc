import 'package:flutter/material.dart';

const descricaoTextStyle = TextStyle(
  fontSize: 15.0,
  color: Colors.black,
);

class ConteudoIcone extends StatelessWidget {
  ConteudoIcone({required this.icone, required this.descricao});
  final IconData icone;
  final String descricao;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icone,
          size: 80.0,
        ),
        SizedBox(
          height: 12.0,
        ),
        Text(
          descricao,
          style: descricaoTextStyle,
        )
      ],
    );
  }
}