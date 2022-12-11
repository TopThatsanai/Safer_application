import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safer/auth.dart';
import 'package:safer/components/background.dart';
import 'package:safer/constants.dart';
import 'package:safer/model/task.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:safer/screens/read_data/get_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final task = FirebaseAuth.instance.currentUser!;
  final User? user = Auth().currentUser;
  //document IDs
  List<String> docIDs = [];

  //get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('task').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            },
          ),
        );
  }

  // @override
  // void initState() {
  //   getDocId();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onDoubleTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: Icon(Icons.logout),
            ),
            Text(user?.email ?? 'User email'),
            Expanded(
              child: FutureBuilder(
                future: getDocId(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: GetTaskName(documentId: docIDs[index]),
                          tileColor: kPrimaryLightColor,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  // Widget buildTask(Task task) => ListTile(
  //       title: Text(task.name_task),
  //       subtitle: Text(task.detail_task),
  //     );

  // Stream<List<Task>> readTasks() => FirebaseFirestore.instance
  //     .collection('task')
  //     .snapshots()
  //     .map((snapshot) =>
  //         snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList());

  // static Task fromJson(Map<String, dynamic> json) => Task(
  //       id: json['id'],
  //       fname: json['fname'],
  //       lname: json['lname'],
  //       address: json['address'],
  //       phone: json['phone'],
  //       name_task: json['name_task'],
  //       detail_task: json['detail_task'],
  //     );

//}

// class Task {
//   String id;
//   final String fname;
//   final String lname;
//   final String phone;
//   final String address;
//   final String name_task;
//   final String detail_task;

//   Task({
//     this.id = '',
//     required this.fname,
//     required this.lname,
//     required this.phone,
//     required this.address,
//     required this.name_task,
//     required this.detail_task,
//   });

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'fname': fname,
//         'lname': lname,
//         'phone': phone,
//         'address': address,
//         'name_task': name_task,
//         'detail_task': detail_task,
//       };

//   static fromJson(Map<String, dynamic> json) => Task(
//         id: json['id'],
//         fname: json['fname'],
//         lname: json['lname'],
//         phone: json['phone'],
//         address: json['address'],
//         name_task: json['name_task'],
//         detail_task: json['detail_task'],
//       );
// }