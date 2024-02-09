import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task_management/constants.dart';

import '../model/task_model.dart';
import '../providers/task_provider.dart';
import '../screens/task_detail_page.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  TaskCard({required this.task});

  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskProvider>(context);
    bool isExpanded =
        taskProvider.expandedStates[taskProvider.tasks.indexOf(task)] ?? false;

    return Card(
      elevation: 0,
      color: primaryColor.withOpacity(0.2),
      child: ExpansionTile(
        tilePadding: EdgeInsets.only(right: 10),
        trailing: isExpanded
            ? Icon(
                FontAwesomeIcons.circleMinus,
                color: Colors.redAccent,
              )
            : Icon(
                FontAwesomeIcons.circlePlus,
              ),
        onExpansionChanged: (isExpanded) {
          taskProvider.setExpandedState(
              taskProvider.tasks.indexOf(task), isExpanded);
        },
        initiallyExpanded: isExpanded,
        title: ListTile(
          title: Text(
            task.title,
            style: titleStyle,
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: height(context) * 0.01,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: width(context) * 0.04),
                      child: Text(
                        task.subtitle,
                        style: subTitleStyle.copyWith(fontSize: 17),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskDetailPage(task: task),
                          ),
                        ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryColor),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        'View Details',
                        style: subTitleStyle.copyWith(fontSize: 14),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
