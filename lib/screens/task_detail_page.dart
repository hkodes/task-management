import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_management/screens/task_list_page.dart';
import '../constants.dart';
import '../model/task_model.dart';

class TaskDetailPage extends StatelessWidget {
  final Task task;

  TaskDetailPage({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => popNav(context),
          icon: Icon(
            FontAwesomeIcons.anglesLeft,
            color: primaryColor,
          ),
        ),
        title: Text('Task Manager', style: titleStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: width(context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: primaryColor.withOpacity(0.2)),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: titleStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      task.title,
                      style: subTitleStyle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                width: width(context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: primaryColor.withOpacity(0.2)),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Subtitle',
                        style: titleStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        task.subtitle,
                        style: subTitleStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
