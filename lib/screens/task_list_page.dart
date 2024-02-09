import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../model/task_model.dart';
import '../providers/task_provider.dart';
import '../widgets/add_task_dialog.dart';
import '../widgets/task_card.dart';

class TaskListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          FontAwesomeIcons.barsStaggered,
          color: primaryColor,
        ),
        title: Text('Task Manager', style: titleStyle),
      ),
      body: TaskList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () => _showAddTaskDialog(context),
        child: Icon(FontAwesomeIcons.plus, color: Colors.white),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController subtitleController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddTaskDialog(
          titleController: titleController,
          subtitleController: subtitleController,
          onCancel: () {
            Navigator.of(context).pop();
          },
          onAdd: () {
            String title = titleController.text;
            String subtitle = subtitleController.text;

            if (title.isNotEmpty && subtitle.isNotEmpty) {
              var taskProvider =
                  Provider.of<TaskProvider>(context, listen: false);
              taskProvider.addTask(Task(title, subtitle));
              Navigator.of(context).pop();
            } else {
              showToast(context, "Please enter title and subtitle");
            }
          },
        );
      },
    );
  }
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskProvider>(context, listen: true);

    return taskProvider.tasks.isEmpty
        ? SizedBox(
            height: height(context),
            width: width(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.barsProgress,
                  color: primaryColor.withOpacity(0.5),
                  size: height(context) * 0.15,
                ),
                SizedBox(
                  height: height(context) * 0.03,
                ),
                Text(
                  "No Tasks found",
                  style: titleStyle.copyWith(
                    letterSpacing: 1,
                    color: primaryColor.withOpacity(0.6),
                  ),
                )
              ],
            ),
          )
        : ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 70),
            itemCount: taskProvider.tasks.length,
            itemBuilder: (context, index) {
              Task task = taskProvider.tasks[index];
              return TaskCard(
                task: task,
              );
            },
          );
  }
}
