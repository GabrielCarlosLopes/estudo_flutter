import 'package:flutter/material.dart';
import './question.dart';
import './reply.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) reply;

  Quiz({
    @required this.questions,
    @required this.selectedQuestion,
    @required this.reply,
  });

  bool get haveAnyQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas =
        haveAnyQuestion ? questions[selectedQuestion]['respostas'] : null;

    return Column(
      children: <Widget>[
        Questao(questions /*.elementAt*/ [selectedQuestion]['texto']),
        ...respostas.map((resp) { 
          return Resposta(
            resp['texto'], 
            () => reply(resp['pontuacao']),
          );
        }).toList(),
      ],
    );
  }
}
