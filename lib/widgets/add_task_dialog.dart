import 'package:flutter/material.dart';
import 'package:task_management/constants.dart';

class AddTaskDialog extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController subtitleController;
  final VoidCallback onCancel;
  final VoidCallback onAdd;

  AddTaskDialog({
    required this.titleController,
    required this.subtitleController,
    required this.onCancel,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        // Rounded corners
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: height(context) * 0.015,
            ),
            Text(
              "Add Task",
              style: titleStyle.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: height(context) * 0.02,
            ),
            TextField(
              controller: titleController,
              maxLines: 1,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Title',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              maxLines: 5,
              controller: subtitleController,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: 'Subtitle',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: onCancel,
                  child: Text(
                    'Cancel',
                    style: subTitleStyle.copyWith(fontSize: 16),
                  ),
                ),
                SizedBox(width: 16),
                GestureDetector(
                  onTap: onAdd,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        'Add',
                        style: subTitleStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
