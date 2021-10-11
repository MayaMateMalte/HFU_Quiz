        import 'package:classroomquiz/db/IncorrectCorrectAnswered_database.dart';
import 'package:classroomquiz/db/gamename_database.dart';
        import 'package:classroomquiz/db/questions_database.dart';
        import 'package:classroomquiz/db/usernamedatabase.dart';
import 'package:classroomquiz/model/IncorrectCorrectAnswered.dart';
        import 'package:classroomquiz/model/gamename.dart';
        import 'package:classroomquiz/model/questions.dart';
        import 'package:classroomquiz/model/username.dart';
        import 'package:classroomquiz/page/usernameinputpage.dart';
        import 'package:flutter/material.dart';

        class SettingsPage extends StatefulWidget {
          SettingsPage({Key? key}) : super(key: key);

          @override
          _SettingsWidgetState createState() => _SettingsWidgetState();
        }

        class _SettingsWidgetState extends State<SettingsPage> {
          final scaffoldKey = GlobalKey<ScaffoldState>();
          TextEditingController textEditingController = new TextEditingController();
          late List<Questions> questionsfuture;
          late List<Username> usernamesfutureList;
          late String puffer;
          late Gamename gamenamefuture;
          static String gamenamefutureId1 ="";
          late Username usernamefuture;
          static String usernamefutureId1 ="";
          late Future<int> sqlcounter;
          static List<String> pufferlist= [];
          static List <String> pufferlist2 = [];
          static int sqlstaticcounter = 0;
          @override
          void initState() {

            refreshNotes();
            getDataBaseSize();
            getUserName();
            getGameName();
            //getAllUsernames();
            super.initState();
          }

           IncorrectCorrectAnswered inCo1 = new IncorrectCorrectAnswered(

            questiontext: "Ist Java eine Insel ?",
            iscorrect: "true",
            gamename: "Programmieren 2",
            gamecounter: 1
           );

          IncorrectCorrectAnswered inCo2 = new IncorrectCorrectAnswered(

              questiontext: "Was ist HTML?",
              iscorrect: "true",
              gamename: "Programmieren 2",
              gamecounter: 1
          );
          IncorrectCorrectAnswered inCo3 = new IncorrectCorrectAnswered(

              questiontext: "Was ist HTML?",
              iscorrect: "true",
              gamename: "Programmieren 2",
              gamecounter: 1
          );




          Questions q1 = new Questions(
              gamename: "Programmieren 2",
              questiontext: "Was ist Java ?",
              answer1: "A",
              answer2: "B",
              answer3: "C",
              answer4: "D",
              categoryid: 1,
              solution: 'B');
          Questions q2 = new Questions(
              gamename: "Programmieren 2",
              questiontext: "Frage 1",
              answer1: "Antwort zu Frage 1 -> A",
              answer2: "Antwort zu Frage 1 -> B",
              answer3: "Antwort zu Frage 1 -> C",
              answer4: "Antwort zu Frage 1 -> D",
              categoryid: 1,
              solution: 'B');
          Questions q3 = new Questions(
              gamename: "Rechnungswesen",
              questiontext: "Wie geht´s ?",
              answer1: "A",
              answer2: "B",
              answer3: "C",
              answer4: "D",
              categoryid: 1,
              solution: 'B');
          Questions q4 = new Questions(
              gamename: "Programmieren 2",
              questiontext: "Frage 2",
              answer1: "Antwort zu Frage 2 -> A",
              answer2: "Antwort zu Frage 2 -> B",
              answer3: "Antwort zu Frage 2 -> C",
              answer4: "Antwort zu Frage 2 -> D",
              categoryid: 1,
              solution: 'C');
          Questions q5 = new Questions(
              gamename: "Programmieren 2",
              questiontext: "Frage 3",
              answer1: "Antwort zu Frage 3 -> A",
              answer2: "Antwort zu Frage 3 -> B",
              answer3: "Antwort zu Frage 3 -> C",
              answer4: "Antwort zu Frage 4 -> D",
              categoryid: 1,
              solution: 'A');
          Questions q6 = new Questions(
              gamename: "Rechnungswesen",
              questiontext: "Frage 3",
              answer1: "Antwort zu Frage 3 -> A",
              answer2: "Antwort zu Frage 3 -> B",
              answer3: "Antwort zu Frage 3 -> C",
              answer4: "Antwort zu Frage 4 -> D",
              categoryid: 1,
              solution: 'A');

          Gamename g1 = new Gamename(gamename: "Programmieren 2");
          Gamename g2 = new Gamename(gamename: "Rechnungswesen");

          Future getDataBaseSize() async {
            this.questionsfuture = await QuestionsDatabase.instance.readAllQuestions();
            print(questionsfuture.length);
            sqlstaticcounter = questionsfuture.length;
           // sqlcounter = questionsfuture.length;

          }
                  Future getGameName() async{
                    this.gamenamefuture = await GamenameDatabase.instance.readGamenamebyId(1);
                    print(gamenamefuture.gamename);
                    gamenamefutureId1 = gamenamefuture.gamename;
                    if(usernamefutureId1.isEmpty){
                      gamenamefutureId1 = "Kein Gamename vorhanden";

                    }
                    setState(() {

                    });

                  }

          Future getUserName()async{
            this.usernamefuture = await UsernameDatabase.instance.readUsernamebyId(1);
            print(usernamefuture.username);
            usernamefutureId1 = usernamefuture.username;
            if(usernamefutureId1.isEmpty){
              usernamefutureId1 = "Kein Username vorhanden";
            }
            setState(() {

            });

          }
          Future getAllUsernames() async{
            this.usernamesfutureList = await UsernameDatabase.instance.readAllUsernames();
            print("Anzahl angelegter Usernames");
            print(usernamesfutureList.length);
          }

          Future refreshNotes() async {
            this.questionsfuture = await QuestionsDatabase.instance.readAllQuestions();

            if (questionsfuture.isNotEmpty) {
              print(questionsfuture.length);
           //   sqlstaticcounter = questionsfuture.length;
              //sqlcounter = questionsfuture.length;
              for (Questions item in questionsfuture) {
                print(item);
              }
            }
          }



          Future getnames() async {
           // this.questionsfuture = await QuestionsDatabase.instance.getGamenames();
            this.questionsfuture = await QuestionsDatabase.instance.readAllQuestions();


            int i = 0;
            if(questionsfuture.isNotEmpty){
              print(questionsfuture.length);
              for(Questions item in questionsfuture)
                {
                 // print(pufferlist.length);
                 // print(item.gamename);
                  pufferlist.add(item.gamename);
                }
              pufferlist2 = pufferlist.toSet().toList();
              print(pufferlist2);
              print(pufferlist2.length);

            }
            return pufferlist2;
          }

          @override
          Widget build(BuildContext context) {
            getDataBaseSize();
            return Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                backgroundColor: Color(0xFF16804E),
                title: Text("Einstellungen"),
              ),
              body: Center(
                child: Container(
                    child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                      child: Text("SQL Funktionen der App testen"),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () async {
                        await QuestionsDatabase.instance.create(q1);
                        await QuestionsDatabase.instance.create(q2);
                        await QuestionsDatabase.instance.create(q3);
                        await QuestionsDatabase.instance.create(q4);
                        await QuestionsDatabase.instance.create(q5);
                        await QuestionsDatabase.instance.create(q6);
                        getDataBaseSize();
                        setState(() {});
                      },
                      child: Text('Beispieldaten in Datenbank schreiben'),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () async {
                        refreshNotes();
                        await QuestionsDatabase.instance.readAllQuestions();
                        getDataBaseSize();
                        setState(() {});
                      },
                      child: Text('Beispieldaten in Datenbank lesen'),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () async {
                        refreshNotes();
                        await QuestionsDatabase.instance.dropTable();
                        getDataBaseSize();
                        setState(() {});
                      },
                      child: Text('Beispieldaten in Datenbank löschen'),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text("Anzahl Datensätze Quizobjekte:$sqlstaticcounter",style: TextStyle(fontSize: 16)),


                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),

                      child: Text("Username: $usernamefutureId1",style: TextStyle(fontSize: 16),),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () async {
                        refreshNotes();
                        await UsernameDatabase.instance.dropTable();
                        getDataBaseSize();
                        setState(() {});
                        print("Usernames gelöscht");
                        puffer = "Kein Username vorhanden";
                        Username u1 = new Username(username: puffer);
                        await UsernameDatabase.instance.create(u1);
                        print("Username -> Kein Username wurde angelegt");
                        List<Username> usernamepufer1 = await UsernameDatabase.instance.readAllUsernames();
                        setState(() {});


                      },
                      child: Text('Username löschen'),

                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () async {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => UserNameInputApp()));
                      print("Seite aufgerufen");
                      Username u1 = new Username(username: puffer);
                      List<Username> usernamepufer1 = await UsernameDatabase.instance.readAllUsernames();
                      print(usernamepufer1);
                      setState(() {});


                      },
                      child: Text('Username Anlegen'),

                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () async {
                        await GamenameDatabase.instance.create(g1);
                        await GamenameDatabase.instance.create(g2);
                        print("Spiel Programmieren 2 angelegt");

                        print("Seite aufgerufen");
                        setState(() {});


                      },
                      child: Text('Game Anlegen'),

                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () async {
                        await GamenameDatabase.instance.deleteTable();


                        print("Seite aufgerufen");
                        setState(() {});


                      },
                      child: Text('Game löschen'),

                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),

                      child: Text("Gamename: $gamenamefutureId1",style: TextStyle(fontSize: 16),),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () async {
                        await IncorrectCorrectAnsweredDatabase.instance.create(inCo1);
                        await IncorrectCorrectAnsweredDatabase.instance.create(inCo2);
                        await IncorrectCorrectAnsweredDatabase.instance.create(inCo3);




                        print("IncorrectCorrectAnswered angelegt");
                        setState(() {});


                      },
                      child: Text('IncorrectCorrectAnswered Anlegen'),

                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () async {
                        await   await IncorrectCorrectAnsweredDatabase.instance.deleteTable();


                        print("IncorrectCorrectAnswered gelöscht");
                        setState(() {});


                      },
                      child: Text('IncorrectCorrectAnswered löschen'),

                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () async {
                        await   await IncorrectCorrectAnsweredDatabase.instance.deleteTable();


                        print("incorrectCorrectAnswered.db gelöscht");
                        setState(() {});


                      },
                      child: Text('DROP DATABASE  IncorrectCorrectAnswered'),

                    ),

                  ],
                )),
              ),
            );
          }
        }
