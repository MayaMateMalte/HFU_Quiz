import 'package:classroomquiz/api/ApiDownloader.dart';
import 'package:classroomquiz/page/chartoverviewpage.dart';
import 'package:classroomquiz/page/chartpage.dart';
import 'package:classroomquiz/page/chartsuccesratepage.dart';
import 'package:classroomquiz/page/quizoverviewpage.dart';
import 'package:classroomquiz/page/settingspage.dart';
import 'package:classroomquiz/page/usernameinputpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:classroomquiz/page/quizpage.dart';
import 'package:classroomquiz/const/const.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:classroomquiz/widget/customwidgets.dart';

void main() {
  runApp(StartApp());
}


class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: StartPage());
  }
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text("", style: TextStyle(color: '0xff16804e'.toColor())),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.data_usage,
                color: '#16804E'.toColor(),
              ),
              onPressed: () async {
                await Navigator.push(context,
                CupertinoPageRoute(
                 builder: (context) => ChartOverviewPage(),
                ),
                );


              }),
          IconButton(
              icon: Icon(
                Icons.settings,
                color: '#16804E'.toColor(),
              ),
              onPressed: () async {
                await Navigator.push(context,
                  CupertinoPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                );


              })
        ],
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Image.asset("assets/hfu_logo.png"),
              ),
              SizedBox(height: 50),
              Container(
                height: 60,
                margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: SizedBox(
                  width: 250.0,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Agne',
                      color: Colors.black,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('Studieren auf höchstem Niveau!',speed: const Duration(milliseconds: 100)),
                        //TypewriterAnimatedText('Als ein Studium bei der HFU'),
                      //  TypewriterAnimatedText('Ich verachte euch so sehr!'),
                       // TypewriterAnimatedText('Ihr Kackvögel'),

                    ],
                      onTap: () {
                        print("Tap Event");

                      },
                    ),
                  ),
                ),
              ),
              //SizedBox(height: 100),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => QuizOverViewPage()));
                          print("Quiz auswählen pressed");
                        },
                        child: Text(
                          'Quiz auswählen',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ))),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            )),
                      onPressed: () {Navigator.push(
                        context,
                        CupertinoPageRoute(
                        builder: (context) => ApiDownloaderPage()));
                        print("Json Files pressed");
                        },


                        child: Text(
                          'Download Json Files',
                          style: TextStyle(color: Colors.white,fontSize: 18),
                        ),
                      ))),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            )),
                        onPressed: () {Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => ChartApp()));
                        print("Auswertung der Spieldaten");
                        },


                        child: Text(
                          'Auswertung der Spieldaten AnzahlSpiele',
                          style: TextStyle(color: Colors.white,fontSize: 18,),
                        ),
                      ))),


            ],
          )),
    );
  }
}
