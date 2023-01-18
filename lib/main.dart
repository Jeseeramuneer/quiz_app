import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


Operation op=new Operation();

void main()=>runApp(MaterialApp(home: home(),debugShowCheckedModeBanner: false,));
class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyApp(),
    );
  }
}


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List <Icon>icons=[];

  void answers(bool r)
  {
    bool val=op.getCorrectAns();
    setState(() {
      if(op.isFinished()==true){
        Alert(context: context,
            title: "Finished",
            desc: "do u have continue?",
            buttons: [DialogButton(child: Text("Continue",style: TextStyle(fontSize: 20),),
                onPressed: ()=>Navigator.pop(context))]
        ).show();
        op.reset();
        icons=[];
      }
      else{
        if(val==r)
        {
          icons.add(Icon(Icons.check,color: Colors.green));
        }
      else
        {
          icons.add(Icon(Icons.close,color: Colors.red,));
        }
        op.nextQue();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(
            child: Text(
              "Quiz App",style: TextStyle(
                color:Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            ),
          )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Text(op.getQueText(),style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,
                color: Colors.white),)),
           SizedBox(height: 200,),
           Container(
             height: 40,
             decoration:BoxDecoration(borderRadius: BorderRadius.circular(5),
             color: Colors.red),
             child: TextButton(onPressed: (){
               answers(true);
             },
                 child: Center(child: Text("True",style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold,
                     color: Colors.white)))),
             ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
              color: Colors.green),
              child: TextButton(
                  onPressed: (){
                 answers(false);
                  },
                  child:  Center(child: Text("False",style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold,
                  color: Colors.white))))),
            SizedBox(height: 70,),
            Row(
              children:icons,
            )
          ]

        ),
      ),

    );
  }
}

