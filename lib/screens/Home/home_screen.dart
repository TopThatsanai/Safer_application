import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:safer/components/background.dart';
import 'package:safer/model/task.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: StreamBuilder<List<Task>>(
            stream: readTasks(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final task = snapshot.data!;

                return ListView(
                  children: task.map(buildTask).toList(),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Widget buildTask(Task task) => ListTile(
        title: Text(task.name_task),
        subtitle: Text(task.detail_task),
      );

  Stream<List<Task>> readTasks() => FirebaseFirestore.instance
      .collection('task')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList());

  // static Task fromJson(Map<String, dynamic> json) => Task(
  //       id: json['id'],
  //       fname: json['fname'],
  //       lname: json['lname'],
  //       address: json['address'],
  //       phone: json['phone'],
  //       name_task: json['name_task'],
  //       detail_task: json['detail_task'],
  //     );

}

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
