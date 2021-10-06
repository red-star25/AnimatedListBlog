import 'package:animation_blog/model/todo_item.dart';
import 'package:flutter/material.dart';

class WithoutAnimationTodoWidget extends StatefulWidget {
  final Todo todo;
  final Function onClicked;
  const WithoutAnimationTodoWidget(
      {Key? key, required this.todo, required this.onClicked})
      : super(key: key);

  @override
  State<WithoutAnimationTodoWidget> createState() =>
      _WithoutAnimationTodoWidgetState();
}

class _WithoutAnimationTodoWidgetState
    extends State<WithoutAnimationTodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
