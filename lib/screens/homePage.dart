import 'package:flutter/material.dart';
import 'package:todo/database_helper.dart';
import 'package:todo/screens/taskPage.dart';
import 'package:todo/widgets.dart';

import '../models/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          color: const Color(0xffff6f6f6),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 32.0, top: 32.0),
                    child: const Image(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                  Expanded(
                      child: FutureBuilder<List<Task>>(
                    future: _dbHelper.getTasks(),
                    builder: (context, snapshot) {
                      return ScrollConfiguration(
                        behavior: NoGlowBehaviour(),
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return TaskCardWidget(
                                title: snapshot.data![index].title,
                              );
                            }),
                      );
                    },
                  ))
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TaskPage()))
                        .then((value) => setState(() {}));
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xff7349fe), Color(0xff643fdb)],
                            begin: Alignment(0.0, -1.0),
                            end: Alignment(0.0, -1.0)),
                        color: const Color(0xff7349fe),
                        borderRadius: BorderRadius.circular(28.0)),
                    child: const Image(
                        image: AssetImage('assets/images/add_icon.png')),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
