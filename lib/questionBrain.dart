
import 'question.dart';
class QuestionBrain {
   int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question('I\'m a looser',false),
    Question( 'I don\'t deserver to live here',true),
    Question('I\'m a looser',true)
  ];
  void nextQuestion(){
    if(_questionNumber < _questionBank.length - 1){
    _questionNumber++;
    }
  }
  bool isFinished(){
    if(_questionNumber >= _questionBank.length -1){
      return true;
    }else {
      return false;
    }
  }
   void reset() {
     _questionNumber = 0;
   }
  String getQuestionText(){
    return _questionBank[_questionNumber].question;
  }
  bool getQuestionAnswer(){
    return _questionBank[_questionNumber].answer;
  }
}
