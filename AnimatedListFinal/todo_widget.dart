import 'package:animation_blog/model/todo_item.dart';
import 'package:flutter/material.dart';

class TodoItemWidget extends StatefulWidget {
  final Todo todo;
  final Animation<double> animation;
  final Function onClicked;
  const TodoItemWidget(
      {Key? key,
      required this.todo,
      required this.animation,
      required this.onClicked})
      : super(key: key);

  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: widget.animation,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: CheckboxListTile(
            onChanged: (value) => widget.onClicked(value),
            value: widget.todo.isCompleted,
            title: Text(
              widget.todo.title,
            ),
          ),
        ),
      ),
    );
  }
}
