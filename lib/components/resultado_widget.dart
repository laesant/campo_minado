import 'package:flutter/material.dart';

class ResultadoWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool? venceu;
  final void Function() onReiniciar;

  const ResultadoWidget(
      {super.key, required this.venceu, required this.onReiniciar});

  Color get _getCor {
    if (venceu == null) {
      return Colors.yellow;
    } else if (venceu!) {
      return Colors.green.shade300;
    } else {
      return Colors.red.shade300;
    }
  }

  IconData get _getIcone {
    if (venceu == null) {
      return Icons.sentiment_neutral;
    } else if (venceu!) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: CircleAvatar(
          child: IconButton.filled(
              padding: EdgeInsets.zero,
              style: IconButton.styleFrom(
                backgroundColor: _getCor,
                focusColor: _getCor.withAlpha(150),
              ),
              onPressed: onReiniciar,
              icon: Icon(
                _getIcone,
                color: Colors.black,
                size: 35,
              )),
        ),
      )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
