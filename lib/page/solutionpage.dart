import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:classroomquiz/db/IncorrectCorrectAnswered_database.dart';
import 'package:classroomquiz/model/IncorrectCorrectAnswered.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:classroomquiz/widget/customwidgets.dart';

import '../main.dart';

class SolutionPage extends StatefulWidget{
  String value = "Test";
  int gameCounterValue = 0;
  SolutionPage({required this.value,required this.gameCounterValue, Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SolutionPage(value: value,gameCounterValue:gameCounterValue);

}

class _SolutionPage extends State<SolutionPage>{



  _SolutionPage({required this.value,required this.gameCounterValue});
  final String value;
   final int gameCounterValue;

   bool answerschecked = false ;
  int size = 0;
  late int gameSize = 0;

  List<IncorrectCorrectAnswered> incorrectCorrectAnsweredList = [];
  List<IncorrectCorrectAnswered> incorrectCorrectAnsweredListpuffer =[];
  List<IncorrectCorrectAnswered> incorrectCorrectAnsweredListpuffer2 =[];
  List<IncorrectCorrectAnswered> incorrectCorrectAnsweredListpuffer3 =[];

   getIncorrectCorrectAnswered() async {
   if(answerschecked == false)
   {
     incorrectCorrectAnsweredList = await IncorrectCorrectAnsweredDatabase.instance.readAllIncorrectCorrectAnswered();
     answerschecked = true;
    // incorrectCorrectAnsweredListpuffer = incorrectCorrectAnsweredList.reversed.toList();
     incorrectCorrectAnsweredListpuffer = incorrectCorrectAnsweredList.reversed.toList();
     IncorrectCorrectAnswered InCo1;
      for(int i = 0; i < gameCounterValue; i++){
        InCo1 = incorrectCorrectAnsweredListpuffer[i];
        incorrectCorrectAnsweredListpuffer3.add(InCo1);
      }

      print(incorrectCorrectAnsweredListpuffer3);

       print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

       print(size);
      print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
     print(incorrectCorrectAnsweredListpuffer3.length);
     print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
     IncorrectCorrectAnswered InCo2;
     for(int i = 0; i < incorrectCorrectAnsweredListpuffer3.length; i++){
       if(incorrectCorrectAnsweredListpuffer3[i].iscorrect == "false"){
         InCo2 = incorrectCorrectAnsweredListpuffer3[i];
         print("false wurde erkannt");
         incorrectCorrectAnsweredListpuffer2.add(InCo2);
         print(incorrectCorrectAnsweredListpuffer2.length);
       }

     }
     print(incorrectCorrectAnsweredListpuffer2);

     return incorrectCorrectAnsweredListpuffer2;}
   else return null;

  }

  @override
  initState()   {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF16804E),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text("Ergebnis",style: TextStyle(color: '0xff16804e'.toColor())),


        centerTitle: true,
      ),
        backgroundColor: Color(0xFF16804E),
      body: Center(

          child:  Column(
            children: [
              Container(
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText("$value Fragen richtig beantwortet!",textAlign: TextAlign.center,
                        textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),speed: const Duration(milliseconds: 100)),
                  ],

                ),),
              Container(
                margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),

                child: Text("",textAlign: TextAlign.center,style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal)),
                decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(20))),
         
              ),

              Container(
                margin: EdgeInsets.fromLTRB(0,  MediaQuery.of(context).size.height * 0.01, 0, 0),
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(image: DecorationImage(

                    image:AssetImage("assets/background.png"),
                    fit: BoxFit.none),  borderRadius: BorderRadius.all(Radius.circular(20))),



                child: FutureBuilder(
                   future:getIncorrectCorrectAnswered(),
                  builder:(context, AsyncSnapshot snapshot){
                  if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                  } else {
                    child:
                   return Scrollbar(isAlwaysShown: true,
                     child: ListView.builder(
                          itemCount: incorrectCorrectAnsweredListpuffer2.length,
                        //  controller: _scrollController,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(

                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              margin: EdgeInsets.fromLTRB( MediaQuery.of(context).size.width * 0.01, 0,  MediaQuery.of(context).size.width * 0.01, 0),
                              child: answerCard(
                                  incorrectCorrectAnsweredListpuffer2[index]
                                      .questiontext, Colors.white70, context),
                            );
                          }),
                   );

                  } }),
              ),
              Container(
                   margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.01,MediaQuery.of(context).size.height * 0.015,
                       MediaQuery.of(context).size.width * 0.01,0),
                  width: MediaQuery
                  .of(context)
                  .size
                  .width,

                  height: MediaQuery.of(context).size.height * 0.25,
                  child: solutionCard("    Niemand kriegt beim ersten Mal alles richtig hin. Was uns ausmacht, ist, wie wir aus unseren Fehlern lernen."
                      "Richard Branson", context),decoration: BoxDecoration(image: DecorationImage(

                  image:AssetImage("assets/paper_texture.png"),
                  fit: BoxFit.none),  borderRadius: BorderRadius.all(Radius.circular(20))),
                ),

              Container(margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.055, 0, 0),

                child: SizedBox(
                  child: GestureDetector(
                    onTap:(){
                      Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(builder: (BuildContext context) => StartPage()),
                          ModalRoute.withName('/')
                      );
                    },
                   child: FittedBox(
                    fit: BoxFit.fill,
                    child: submitButton("Quiz Verlassen",context)),
                  ),
                ),
              ),
          ]),


            ),
      );

  }

}