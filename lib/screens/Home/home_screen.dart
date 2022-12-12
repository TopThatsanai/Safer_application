import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safer/auth.dart';
import 'package:safer/components/background.dart';
import 'package:safer/components/rounded_button.dart';
import 'package:safer/constants.dart';
import 'package:safer/screens/Post/post_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            Column(
              children: [
                Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(200, 0, 0, 0),
                        child: Text(user?.email ?? 'User email'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: GestureDetector(
                          onDoubleTap: () {
                            FirebaseAuth.instance.signOut();
                          },
                          child: const Icon(Icons.logout),
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                    '----------------------------------------------------------'),
              ],
            ),
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
            RoundedButton(
              text: 'Create task',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PostScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
