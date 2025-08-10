import 'package:flutter/material.dart';
import 'package:todo25/models/task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel> tasks = [
    TaskModel(title: "T1", subTitle: "ST1", createdAt: DateTime.now()),
    TaskModel(title: "T2", subTitle: "ST1", createdAt: DateTime.now()),
    TaskModel(title: "T3", subTitle: "ST1", createdAt: DateTime.now()),
    TaskModel(title: "T4", subTitle: "ST1", createdAt: DateTime.now()),
    TaskModel(title: "T5", subTitle: "ST1", createdAt: DateTime.now()),
    TaskModel(title: "T6", subTitle: "ST1", createdAt: DateTime.now()),
    TaskModel(title: "T7", subTitle: "ST1", createdAt: DateTime.now()),
    TaskModel(title: "T8", subTitle: "ST1", createdAt: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(text: "DONE"),
                  Tab(text: "WAITING"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text("DONE")),
                    Center(
                      child: ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 40,
                              color: Colors.blue,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  tasks[index].title,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
