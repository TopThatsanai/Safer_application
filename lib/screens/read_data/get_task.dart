import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetTaskName extends StatelessWidget {
  final String documentId;

  GetTaskName({required this.documentId});

  @override
  Widget build(BuildContext context) {
    //get the collection
    CollectionReference task = FirebaseFirestore.instance.collection('task');

    return FutureBuilder<DocumentSnapshot>(
      future: task.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('${data['name_task']}');
        }
        return Text('loading...');
      }),
    );
  }
}
