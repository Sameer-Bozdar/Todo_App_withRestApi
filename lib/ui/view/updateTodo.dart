import 'dart:async';
import 'package:courier_management_system/core/utils/utils.dart';
import 'package:courier_management_system/ui/view/todo_listView.dart';
import 'package:courier_management_system/ui/viewModel/fetchDataViewModel.dart';
import 'package:flutter/material.dart';

import '../viewModel/putDataViewModel.dart';

class UpdateTodoView extends StatefulWidget {
  String id;
  String title;
  String description;

  UpdateTodoView(
      {super.key,
      required this.id,
      required this.title,
      required this.description});

  @override
  State<UpdateTodoView> createState() => _UpdateTodoViewState();
}

class _UpdateTodoViewState extends State<UpdateTodoView> {
  TextEditingController? titleController ;
  TextEditingController? descriptionController;

  PutDataViewModel putDataViewModel = PutDataViewModel();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController(text: widget.title);
    descriptionController = TextEditingController(text:widget.description);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Update Notes')),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          TextFormField(
            // initialValue: widget.title ?? 'weoiru',
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Title',
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            // initialValue: widget.description ?? 'rewi',
            controller: descriptionController,
            decoration: const InputDecoration(
                hintText: 'Description',
                ),
            maxLines: 8,
            minLines: 5,
            keyboardType: TextInputType.multiline,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                // final title = titleController.text;
                // final description = titleController.text;
                final id = widget.id;
                UpdateData(id);
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Update'),
              ))
        ],
      ),
    );
  }

  Future<void> UpdateData(String id) async {
    final title = titleController!.text;
    final description = descriptionController!.text;

    final body = {
      "title": title,
      "description": description,
      "is_completed": false
    };

    putDataViewModel.fetchUpdateApibyId(id, body,context);
  }
}
