import 'package:flutter/material.dart';
import 'package:todo/screens/taskPage.dart';
import 'package:todo/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      child: ListView(children: [
                    TaskCardWidget(),
                    TaskCardWidget(),
                    TaskCardWidget(),
                    TaskCardWidget(),
                    TaskCardWidget(),
                    TaskCardWidget(),
                    TaskCardWidget(),
                  ]))
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TaskPage()));
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
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
