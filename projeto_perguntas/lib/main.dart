import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 1},
        {'texto': 'Verde', 'pontuacao': 5},
        {'texto': 'Branco', 'pontuacao': 3},
      ],
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 3},
        {'texto': 'Cobra', 'pontuacao': 1},
        {'texto': 'Elefante', 'pontuacao': 5},
        {'texto': 'Leão', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 5},
        {'texto': 'João', 'pontuacao': 1},
        {'texto': 'Léo', 'pontuacao': 10},
        {'texto': 'Pedro', 'pontuacao': 3},
      ],
    }
  ];

  bool get haveAnyQuestion {
    return _selectedQuestion < _questions.length;
  }

  void _reply( int pontuacao) {
    if (haveAnyQuestion) {
      setState(() {
        _selectedQuestion++;
        _totalScore += pontuacao;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // for( var textoResp in respostas){
    //   widgets.add(Resposta(textoResp, _reply));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: haveAnyQuestion
            ? Quiz(
                questions: _questions,
                selectedQuestion: _selectedQuestion,
                reply: _reply,
              )
            : Resultado(_totalScore, _restartQuiz),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
