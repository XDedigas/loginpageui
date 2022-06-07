import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class CampoColumn extends StatelessWidget {
  final String nome;
  final String? hint;
  final IconData? icone;
  final bool? isCampoSenha;
  final TextInputType? keybord;
  static const String fonte = 'OpenSans';
  static const Color corBranco = Colors.white;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  CampoColumn({
    required this.nome,
    this.isCampoSenha,
    this.keybord,
    this.hint,
    this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          nome,
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: isCampoSenha ?? false,
            keyboardType: keybord,
            style: const TextStyle(
              color: corBranco,
              fontFamily: fonte,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: icone != null ? Icon(icone, color: corBranco) : null,
              hintText: hint,
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
