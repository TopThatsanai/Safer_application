import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class GetTaskName extends StatelessWidget {
  final String documentId;

  GetTaskName({required this.documentId});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //get the collection
    CollectionReference task = FirebaseFirestore.instance.collection('task');

    return FutureBuilder<DocumentSnapshot>(
      future: task.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            children: [
              Text('Task: ${data['name_task']}'),
              SizedBox(height: size.height * 0.02),
              Text('Detail: ${data['detail_task']}'),
              SizedBox(height: size.height * 0.02),
              Text('The owner of task: ${data['fname']}' +
                  ' ' +
                  '${data['lname']}'),
              SizedBox(height: size.height * 0.02),
              Text('Address: ${data['address']}'),
              SizedBox(height: size.height * 0.02),
              Text('Telephone number: ${data['phone']}'),
              SizedBox(height: size.height * 0.02),
              Text(
                  '---------------------------------------------------------------------------'),
              SizedBox(height: size.height * 0.04),
            ],
          );
        }
        return Text('loading...');
      }),
    );
  }
}
