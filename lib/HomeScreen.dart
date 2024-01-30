import 'package:flutter/material.dart';
import 'package:practiceproject/AddScreen.dart';
import 'package:practiceproject/Edit_Screen.dart';
import 'package:practiceproject/TodoListProperty.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<MyTodo> TodoList = [];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: ListView.builder(
        itemCount: TodoList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            TodoList[index].Title.toString(),
          ),
          subtitle: Text(
            TodoList[index].Description.toString(),
          ),
          trailing: Wrap(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
              ),
              IconButton(
                onPressed: () async {
                  final MyTodo? Result2 = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditScreen(edit: TodoList[index]),
                      ));
                  if (Result2 != null) {
                    setState(() {
                      TodoList[index] = Result2;
                    });
                  }
                },
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _FabTapToAddNew,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _FabTapToAddNew() async {
    final MyTodo? Result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddScreen(),
      ),
    );
    if (Result != null) {
      setState(() {
        TodoList.add(Result);
      });
    }
  }
}
