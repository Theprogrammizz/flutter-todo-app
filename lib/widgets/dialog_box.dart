import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController desController;
  final VoidCallback onSave;
  const DialogBox({
    super.key,
    required this.titleController,
    required this.desController,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade900,
      content: SizedBox(
        height: 220,
        width: 200,
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                hintText: "Task Name",
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            TextField(
              controller: desController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Description",
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    titleController.clear();
                    desController.clear();
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.grey.shade800, // background
                    foregroundColor: Colors.white, // text color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ), // inner padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25), // rounded edges
                    ),
                  ),
                  child: Text("Close", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(width: 10),

                FilledButton(
                  onPressed: () {
                    onSave();
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.grey.shade800, // background
                    foregroundColor: Colors.white, // text color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ), // inner padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25), // rounded edges
                    ),
                  ),
                  child: Text(
                    "Add Task",
                    style: TextStyle(color: Colors.white),
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
