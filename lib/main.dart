import 'package:flutter/material.dart';
import 'package:flutter_application_widgets_api/models/student.dart';

void main() {
  runApp(MyApp());
}

//Color darkBlue = const Color.fromARGB(0, 0, 0, 47);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //cupertiono
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  List<Student> students = [
    Student.withId(1, 55, "Baltacı", "Furkan"),
    Student.withId(2, 65, "Sancak", "Halit"),
    Student.withId(3, 85, "Yalçin", "Berk")
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("Öğrenci Takip Sistemi")),
        body: buildBody());
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(students[index].firstName +
                      " " +
                      students[index].lastName),
                  subtitle: Text("Sınavdan aldığı puan " +
                      students[index].grade.toString()),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.iconsdb.com/icons/preview/royal-blue/checkmark-xxl.png"),
                  ),
                );
              }),
        )
      ],
    );
  }
}
