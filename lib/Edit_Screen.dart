import 'package:flutter/material.dart';
import 'package:practiceproject/AllTaskLIstArry.dart';

class EditScreen extends StatefulWidget {
  EditScreen({super.key, required this.map, required this.index});

  var map;


  @override
  State<EditScreen> createState() => _EditScreenState();
}

TextEditingController TitleControler = TextEditingController();
TextEditingController DescriptionControler = TextEditingController();

final _formkey = GlobalKey<FormState>();

class _EditScreenState extends State<EditScreen> {
  @override
  void initState() {
    TitleControler.text = widget.map["Title"];
    DescriptionControler.text = widget.map["Description"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Task"),
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
                          MyTaskList.TaskList[widget.index] = {
                            "Title": TitleControler.text,
                            "Description": DescriptionControler.text
                          };
                        }
                        Navigator.pop(context);
                      },
                      child: const Text("Update")))
            ],
          ),
        ),
      ),
    );
  }
}
