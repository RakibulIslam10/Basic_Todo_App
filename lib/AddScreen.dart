import 'package:flutter/material.dart';
import 'package:practiceproject/TodoListProperty.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

final TextEditingController TitleController = TextEditingController();
final TextEditingController DescriptionController = TextEditingController();

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
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
                onPressed: ClickToPopAndAddUserInpu,
                child: const Text("Add"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void ClickToPopAndAddUserInpu() {
    MyTodo UserResult =
        MyTodo(TitleController.text, DescriptionController.text);
    setState(() {
      TitleController.clear();
      DescriptionController.clear();
    });
    Navigator.pop(context, UserResult);
  }
}
