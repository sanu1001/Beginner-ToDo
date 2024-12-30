import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
        left: 25,
        right: 25,
        bottom: 0,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(15),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  checkColor: const Color(0xFFEEEDED),
                  activeColor: const Color(0xFF3E5879),
                  shape: const CircleBorder(),
                  side: const BorderSide(
                    width: 2,
                    color: Colors.blueAccent,
                  ),
                ),
              ),

              Text(
                taskName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                  decorationColor: Colors.white,
                  decorationThickness: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}