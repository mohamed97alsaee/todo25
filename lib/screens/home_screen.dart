import 'package:flutter/material.dart';
import 'package:todo25/models/task_model.dart';
import 'package:todo25/widgets/add_new_task_dialog.dart';
import 'package:todo25/widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

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
      floatingActionButton: FloatingActionButton(
        child: Text(selectedIndex.toString()),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddNewTaskDialog(),
          );
        },
      ),
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Column(
            children: [
              TabBar(
                onTap: (v) {
                  setState(() {
                    selectedIndex = v;
                  });
                },
                tabs: [
                  Tab(text: "DONE"),
                  Tab(text: "WAITING"),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return selectedIndex == 0 && tasks[index].isCompleted
                        ? TaskCard(
                            taskModel: tasks[index],

                            onSwitch: () {
                              setState(() {
                                tasks[index].isCompleted =
                                    !tasks[index].isCompleted;
                              });
                            },
                          )
                        : selectedIndex == 1 && !tasks[index].isCompleted
                        ? TaskCard(
                            taskModel: tasks[index],

                            onSwitch: () {
                              setState(() {
                                tasks[index].isCompleted =
                                    !tasks[index].isCompleted;
                              });
                            },
                          )
                        : SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
