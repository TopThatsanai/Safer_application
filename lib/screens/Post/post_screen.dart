import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:safer/components/background.dart';
import 'package:safer/components/rounded_button.dart';
import 'package:safer/components/rounded_input_field.dart';
import 'package:safer/model/task.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({
    super.key,
  });
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final controller = TextEditingController();
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final titleController = TextEditingController();
  final detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Detail of task to help!!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Color(0xFF43484b),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RoundedInputField(
                      hintText: 'Enter Frist Name Here',
                      icon: Icons.person,
                      controller: fnameController),
                  RoundedInputField(
                    hintText: 'Enter Last Name Here',
                    icon: Icons.person,
                    controller: lnameController,
                  ),
                  RoundedInputField(
                      hintText: 'Enter numberphone',
                      icon: Icons.phone,
                      controller: phoneController),
                  RoundedInputField(
                      hintText: 'Enter address Here',
                      icon: Icons.location_city,
                      controller: addressController),
                  const SizedBox(height: 20),
                  RoundedInputField(
                      hintText: 'Enter Title Here',
                      icon: Icons.title,
                      controller: titleController),
                  RoundedInputField(
                      hintText: 'Enter detail Here',
                      icon: Icons.details,
                      controller: detailController),
                  RoundedButton(
                    text: 'Post',
                    press: () {
                      final task = Task(
                        fname: fnameController.text,
                        lname: lnameController.text,
                        address: addressController.text,
                        phone: phoneController.text,
                        name_task: titleController.text,
                        detail_task: detailController.text,
                      );
                      createTask(task);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future createTask(Task task) async {
  final docTask = FirebaseFirestore.instance.collection('task').doc();
  task.id = docTask.id;
  final json = task.toJson();

  //Create document and write data to Firebase
  await docTask.set(json);
}
