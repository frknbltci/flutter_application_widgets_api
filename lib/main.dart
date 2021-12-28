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

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(1, 25, "Baltacı", "Furkan"),
    Student.withId(2, 45, "Sancak", "Halit"),
    Student.withId(3, 85, "Yalçin", "Berk")
  ];
  Student secilenKisi = Student.withId(0, 0, "Hiç", "Kimse");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("Öğrenci Takip Sistemis")),
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
                      students[index].grade.toString() +
                      "[" +
                      students[index].getStatus +
                      "]"),
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.iconsdb.com/icons/preview/royal-blue/checkmark-xxl.png"),
                  ),
                  trailing: buidStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      this.secilenKisi = students[index];
                    });
                  },
                  onLongPress: () {
                    print("Uzun Basıldı");
                  },
                );
              }),
        ),
        Text("Seçilen Öğrenci  " +
            secilenKisi.firstName +
            " " +
            secilenKisi.lastName),
      ],
    );
  }

  Widget buidStatusIcon(int grade) {
    if (grade >= 50) {
      return const Icon(Icons.done);
    } else if (grade >= 40) {
      return const Icon(Icons.album);
    } else {
      return const Icon(Icons.clear, color: Colors.red);
    }
  }
}
