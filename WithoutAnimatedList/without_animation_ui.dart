import 'package:animation_blog/WithoutAnimation/without_animation_todo_widget.dart';
import 'package:animation_blog/model/todo_item.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class WithoutAnimationUI extends StatefulWidget {
  const WithoutAnimationUI({Key? key}) : super(key: key);

  @override
  _WithoutAnimationUIState createState() => _WithoutAnimationUIState();
}

class _WithoutAnimationUIState extends State<WithoutAnimationUI> {
  final List<Todo> listOfTodo = Data.todoList;
  late int nextTodoIndex = 10;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE6E6EC),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            primary: Colors.blueGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            insertTodo(
                nextTodoIndex++, Todo(title: "Test Todo", isCompleted: false));
          },
          icon: const Icon(Icons.add),
          label: const Text(
            "Add Todo",
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Todos",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Divider(
              endIndent: 20,
              indent: 20,
              color: Colors.grey,
              height: 2,
              thickness: 0.5,
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
                child: ListView.builder(
              itemBuilder: (context, index) =>
                  buildTodo(listOfTodo[index], index),
              itemCount: listOfTodo.length,
            ))
          ],
        ),
      ),
    );
  }

  Widget buildTodo(todo, int index) => WithoutAnimationTodoWidget(
        todo: todo,
        onClicked: (value) {
          setState(() {
            todo.isCompleted = value;
          });
          removeTodo(index);
        },
      );

  void insertTodo(int nextIndex, Todo todo) {
    setState(() {
      listOfTodo.insert(nextIndex, todo);
    });
  }

  void removeTodo(int index) {
    setState(() {
      listOfTodo.removeAt(index);
      nextTodoIndex--;
    });
  }
}
