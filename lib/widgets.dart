import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({Key? key, this.title, this.desc}) : super(key: key);

  final String? title;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "Unnamed title",
            style: const TextStyle(
                color: Color(0xfff211551),
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(desc ?? "No Description",
                style: const TextStyle(
                    fontSize: 16.0, color: Color(0xff86829d), height: 1.5)),
          )
        ],
      ),
    );
  }
}

class TodoWidget extends StatelessWidget {
  const TodoWidget({Key? key, this.text, required this.isDone})
      : super(key: key);

  final String? text;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            margin: const EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
                color: isDone ? const Color(0xff7349fe) : Colors.transparent,
                borderRadius: BorderRadius.circular(6.0),
                border: isDone
                    ? null
                    : Border.all(color: const Color(0xff86829d), width: 1.5)),
            child:
                const Image(image: AssetImage('assets/images/check_icon.png')),
          ),
          Text(text ?? '(Unnamed Todo)',
              style: TextStyle(
                color:
                    isDone ? const Color(0xff211551) : const Color(0xff86829d),
                fontSize: 16.0,
                fontWeight: isDone ? FontWeight.bold : FontWeight.w500,
              ))
        ],
      ),
    );
  }
}
