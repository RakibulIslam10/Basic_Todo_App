import 'package:flutter/material.dart';
import 'package:practiceproject/AllTaskLIstArry.dart';
import 'package:practiceproject/Edit_Screen.dart';
import 'package:practiceproject/Task_Add_Screen.dart';

class FristScreen extends StatefulWidget {
  const FristScreen({super.key});

  @override
  State<FristScreen> createState() => _FristScreenState();
}

class _FristScreenState extends State<FristScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: MyTaskList.TaskList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(MyTaskList.TaskList[index]["Title"]),
            subtitle: Text(
              MyTaskList.TaskList[index]["Description"],
            ),
            trailing: Wrap(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
                IconButton(
                    onPressed: () async {
                      var result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditScreen(
                              map: MyTaskList.TaskList[index], index: index),
                        ),
                      );
                      if (result.toString().isNotEmpty) {
                        setState(() {});
                      }
                    },
                    icon: const Icon(Icons.edit)),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var Result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TaskAddScreen(),
              ));
          if (Result.toString().isNotEmpty) {
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
