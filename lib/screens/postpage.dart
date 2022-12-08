import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key, required this.title});
  final String title;
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController nameContorller = TextEditingController();
  TextEditingController addressContorller = TextEditingController();
  TextEditingController titleContorller = TextEditingController();
  TextEditingController detailContorller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
              child: Column(children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter Name Here'),
              controller: nameContorller,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter address Here'),
              controller: addressContorller,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter Title Here'),
              controller: titleContorller,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter detail Here'),
              controller: detailContorller,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Submit'))
          ])),
        ));
  }
}
