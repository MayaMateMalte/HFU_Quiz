
import 'dart:async';
import 'package:classroomquiz/db/questions_database.dart';
import 'package:classroomquiz/model/questions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class ApiDownloaderPage extends StatefulWidget {
  @override
  ApiDownloaderPageState createState() => ApiDownloaderPageState();
}

List ? data = [];

List<Questions> questionslist = [];
List<Questions> questionslistNewEntrys = [];
List<Questions> questionslistAlreadyExits = [];
bool apiCheck = false;

class ApiDownloaderPageState extends State<ApiDownloaderPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuestionsApi',
      home: Scaffold(

        body: Center(
          child: Column(
              children: [
                SizedBox(height:200),
                TextButton(child: Text("Reset Questionlist"),onPressed: (){
                resetQuestionslist();
              },),
                TextButton(child: Text("Download in Datenbank schreiben"),onPressed: (){
                  writeToDatabase();
                },),
              ]
            ),
        ),
        ),

    );
  }






  Future<String> fetchData() async {
    String urlpuffer = "";
    final url =
        'https://drive.google.com/uc?export=download&id=1ZufPOhnwDPtSC4O-ap-V1vOkwNM8HVQ0';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print(response.toString());
      print('succesfull parse');

      this.setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        data = map["quizsets"];
        //data = json.decode(response.body);
        //print(data);
        data!.forEach((element) =>
            questionslist.add(new Questions.fromJsonApi(element)));
        print("Anzahl der Questionsobjekte");
        print(questionslist.length);
        print(questionslist);
      });
      checkForNewEntrys();
    }

    return "Success!";

  }

  @override
  void initState() {
    resetQuestionslist();
    super.initState();
    if(apiCheck == false){
    fetchData();
    changeApiBool();
    }
    else
      {
      print("Already checked");
    }

  }

  void changeApiBool(){
    apiCheck = true;
  }



  Questions ? q1;
  checkForNewEntrys()  async {
    for(int i = 0; i < questionslist.length; i++){
      final bool puffer = await QuestionsDatabase.instance.readbyQuestiontextAndCheckforExisting(questionslist[i].questiontext);
      print(puffer);
      if(puffer == true){
        print("################################");
        print("Bereits in Datennbank vorhanden");
       print(QuestionsDatabase.instance.readNotebyQuestiontext(questionslist[i].questiontext));
        print(questionslist[i].questiontext);
        questionslistAlreadyExits.add(questionslist[i]);
      }

      else{
        print("++++++++++++++++++++++++++++++++++++++");
        print("Eintrag in Datennbank nicht vorhanden");

        print(QuestionsDatabase.instance.readNotebyQuestiontext(questionslist[i].questiontext));
        print(questionslist[i].questiontext);
        questionslistNewEntrys.add(questionslist[i]);
      }


     }

    showNewEntrys();

  }

  Future<void> writeToDatabase() async {
    print("Write to Database ... ");


    for (int i = 0; i < questionslistNewEntrys.length; i++) {
      await QuestionsDatabase.instance.create(questionslistNewEntrys[i]);
      print("QuestionsObjekt");
      print(questionslistNewEntrys[i]);
    }
    print(" ......finished! ");
  }

  void showNewEntrys(){
    print("New Entrys are:");

    for (int i = 0; i < questionslistNewEntrys.length; i++){
      print(questionslistNewEntrys[i]);
    }

    print("Entrys already exits;");
    for (int i = 0; i < questionslistAlreadyExits.length; i++){
      print(questionslistAlreadyExits[i]);
    }

  }



  void resetQuestionslist() {
    setState(() {
      questionslist = [];
      questionslistNewEntrys = [];
      questionslistAlreadyExits = [];
      apiCheck = false;
    });

  }

}
