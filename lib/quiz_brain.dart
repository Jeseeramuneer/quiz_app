import 'package:quiz_app/quiz.dart';
 class Operation
 {
   int questionNumber=0;
   List<Quiz> queans=[Quiz(str:'Sharks are mammals',a:false),
   Quiz(str:'Sea otters have a favorite rock they use to break open food',a:true),
   Quiz(str:'The blue whale is the biggest animal to have ever lived',a:true),
   Quiz(str:'The hummingbird egg is the worlds smallest bird egg.',a:true),
   Quiz(str:'Pigs roll in the mud because they don’t like being clean.',a:false),
   Quiz(str:'Bats are blind',a:false),
   Quiz(str:'A dog sweats by panting its tongue.',a:false),
   Quiz(str:'It takes a sloth two weeks to digest a meal.',a:true),
     Quiz(str:'The largest living frog is the Goliath frog of West Africa.',a:true),
     Quiz(str:'An ant can lift 1,000 times its body weight',a:false),
   ];
 void nextQue()
 {
   if(questionNumber<=queans.length-1)
     {
       questionNumber++;
     }
 }
 String getQueText()
 {
   return queans[questionNumber].s;
 }
 bool getCorrectAns()
 {
   return queans[questionNumber].ans;
 }
 bool isFinished()
 {
   if(questionNumber>=queans.length-1)
     {
       return true;
     }
   else{
     return false;
   }
 }
 int reset()
 {
   return questionNumber=0;
 }
 }