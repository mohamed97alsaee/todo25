import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo25/providers/dark_mode_provider.dart';
import 'package:todo25/providers/tasks_provider.dart';
import 'package:todo25/widgets/add_new_task_dialog.dart';
import 'package:todo25/widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context, tasksConsumer, _) {
        return Scaffold(
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  Provider.of<DarkModeProvider>(
                    context,
                    listen: false,
                  ).switchMode();
                },
                child: Icon(Icons.dark_mode),
              ),
              SizedBox(height: 32),
              FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AddNewTaskDialog(),
                  );
                },
              ),
            ],
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
                      itemCount: tasksConsumer.tasks.length,
                      itemBuilder: (context, index) {
                        return selectedIndex == 0 &&
                                tasksConsumer.tasks[index].isCompleted
                            ? TaskCard(
                                taskModel: tasksConsumer.tasks[index],

                                onSwitch: () {
                                  tasksConsumer.switchTaskStatus(
                                    tasksConsumer.tasks[index],
                                  );
                                },
                              )
                            : selectedIndex == 1 &&
                                  !tasksConsumer.tasks[index].isCompleted
                            ? TaskCard(
                                taskModel: tasksConsumer.tasks[index],

                                onSwitch: () {
                                  tasksConsumer.switchTaskStatus(
                                    tasksConsumer.tasks[index],
                                  );
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
      },
    );
  }
}
