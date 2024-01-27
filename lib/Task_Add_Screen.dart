import 'package:flutter/material.dart';
import 'package:practiceproject/AllTaskLIstArry.dart';
import 'package:practiceproject/FristScreen.dart';

class TaskAddScreen extends StatefulWidget {
  const TaskAddScreen({super.key});

  @override
  State<TaskAddScreen> createState() => _TaskAddScreenState();
}

TextEditingController TitleControler = TextEditingController();
TextEditingController DescriptionControler = TextEditingController();

final _formkey = GlobalKey<FormState>();

class _TaskAddScreenState extends State<TaskAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: TitleControler,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter task title";
                  }
                  return null;
                },
                decoration: const InputDecoration(hintText: "Task Title"),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: DescriptionControler,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter description";
                  }
                  return null;
                },
                decoration: const InputDecoration(hintText: "Description"),
              ),
              const SizedBox(height: 40),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            MyTaskList.TaskList.add({
                              "Title": TitleControler.text.trim(),
                              "Description": DescriptionControler.text.trim(),
                            });
                            TitleControler.clear();
                            DescriptionControler.clear();
                          });
                        Navigator.pop(context);
                        }
                      },
                      child: const Text("Add Task")))
            ],
          ),
        ),
      ),
    );
  }
}
