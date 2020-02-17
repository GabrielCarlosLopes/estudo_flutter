import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  
  final int score;
  final void Function() restartQuiz;

  Resultado(this.score, this.restartQuiz);

  String get resultMessage {
    if(score < 8){
      return 'Parabéns!';
    } else if (score < 12){
      return 'Você é bom!';
    } else if (score < 16){
      return 'Impressionante';
    } else {
      return 'Nível Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            resultMessage,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          child: Text(
            'Reiniciar',
            style: TextStyle(fontSize: 18)
            ),
          textColor: Colors.blue,
          onPressed: restartQuiz,
        ),
      ],
    );
  }
}
