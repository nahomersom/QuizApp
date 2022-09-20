import 'package:flutter/material.dart';
import 'questionBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionBrain questionBrain = QuestionBrain();
void main(){
  runApp(const Quizzler());
}
class Quizzler extends StatelessWidget{
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blueGrey,
          body:SafeArea(
              child:Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child:QuizlerApp()
              )
          )

      ),
    );
  }
}
class QuizlerApp extends  StatefulWidget{
  const QuizlerApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return QuizlerAppState();
  }
}
class QuizlerAppState extends State<QuizlerApp>{
  List<Icon> storeKeeper = [];

  void correctAnswer(userPickedAnswer){
    bool correctAnswer = questionBrain.getQuestionAnswer();
    setState(()=>{
    if(questionBrain.isFinished()){
      Alert(context: context, title: "Quiz", desc: "You've reached the last questions").show(),
     questionBrain.reset()

    }else{
      if(userPickedAnswer == correctAnswer){
        storeKeeper.add(
            const Icon(
                Icons.check,
                color:Colors.white
            )
        )
      }else{
        storeKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ))
      },
      questionBrain.nextQuestion(),
    }





  });
  }
  @override
  Widget build(BuildContext context){
    bool correctAnswer;
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
           child: Padding(
         padding: const EdgeInsets.all(10.0),
         child: Center(
           child: Text(
             questionBrain.getQuestionText(),
             style: const TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 30,
               color: Colors.white
             ),
           ),
         ),
       )),
        Expanded(

            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
               child: TextButton(
                   style:  TextButton.styleFrom(
                           primary: Colors.white,
                          minimumSize: const Size(500, 60),

                          shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2.0)),
                          ),
                          backgroundColor: Colors.blue,
                          ),
                   onPressed: ()=>{
                         this.correctAnswer(true),
                   },
                   child: const Text('True',
                   style: TextStyle(
                     fontSize: 30,
                     fontWeight: FontWeight.bold
                   ),
                   )
               ),
                ),
              ),
            ),
        Expanded(

          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: TextButton(
                  style:  TextButton.styleFrom(
                    primary: Colors.white,
                    minimumSize: const Size(500, 60),

                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2.0)),
                    ),
                    backgroundColor: Colors.redAccent,
                  ),
                  onPressed: ()=>{
                      this.correctAnswer(false),
          },
                  child: const Text('False',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
            ),
          ),
        ),
        Row(
          children: storeKeeper
        )
      ],
    );
  }
}