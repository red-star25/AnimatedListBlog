import 'package:animation_blog/data.dart';
import 'package:animation_blog/model/todo_item.dart';
import 'package:animation_blog/widget/todo_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimatedList',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final key = GlobalKey<AnimatedListState>();
  final List<Todo> listOfTodo = Data.todoList;
  late int nextTodoIndex = 7;

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
              nextTodoIndex++,
              Todo(title: "Test Todo", isCompleted: false),
            );
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
              child: AnimatedList(
                itemBuilder: (context, index, animation) =>
                    buildTodo(listOfTodo[index], index, animation),
                initialItemCount: listOfTodo.length,
                key: key,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTodo(todo, int index, Animation<double> animation) =>
      TodoItemWidget(
        todo: todo,
        animation: animation,
        onClicked: (value) {
          setState(() {
            todo.isCompleted = value;
          });
          removeTodo(index);
        },
      );

  void insertTodo(int nextIndex, Todo todo) {
    listOfTodo.insert(nextIndex, todo);
    key.currentState!.insertItem(nextIndex);
  }

  void removeTodo(int index) {
    final item = listOfTodo.removeAt(index);
    nextTodoIndex--;
    key.currentState!.removeItem(
      index,
      (context, animation) => buildTodo(item, index, animation),
    );
  }
}
