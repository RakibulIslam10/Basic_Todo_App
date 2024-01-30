import 'package:flutter/material.dart';
import 'package:practiceproject/AddScreen.dart';
import 'package:practiceproject/TodoListProperty.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key, required this.edit});

  final MyTodo edit;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

final TextEditingController TitleController = TextEditingController();
final TextEditingController DescriptionController = TextEditingController();

class _EditScreenState extends State<EditScreen> {
  @override
  void initState() {
    TitleController.text = widget.edit.Title;
    DescriptionController.text = widget.edit.Description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(children: [
          const SizedBox(height: 40),
          TextFormField(
            controller: TitleController,
            decoration: const InputDecoration(hintText: "Title"),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: DescriptionController,
            decoration: const InputDecoration(hintText: "Description"),
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                MyTodo Result2 =
                    MyTodo(TitleController.text, DescriptionController.text);
                Navigator.pop(context, Result2);
              },
              child: const Text("Update"),
            ),
          )
        ]),
      ),
    );
  }
}
