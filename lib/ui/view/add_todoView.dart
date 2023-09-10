import 'dart:async';
import 'package:courier_management_system/core/utils/routes/routes_name.dart';
import 'package:courier_management_system/core/utils/utils.dart';
import 'package:courier_management_system/ui/view/todo_listView.dart';
import 'package:courier_management_system/ui/viewModel/fetchDataViewModel.dart';
import 'package:flutter/material.dart';

import '../viewModel/postDataViewModel.dart';
import '../viewModel/putDataViewModel.dart';


class AddTodoView extends StatefulWidget {



  const AddTodoView({super.key});



  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}


class _AddTodoViewState extends State<AddTodoView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  PostDataViewModel postDataViewModal = PostDataViewModel();



    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Add Notes')),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            const SizedBox(height: 20),
            TextFormField(
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
                  submitData().then((value) {
                    Timer(Duration(seconds: 1), () {
                      Navigator.pushNamed(context, RoutesName.todoList);
                    });
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text('Submit'),
                ))
          ],
        ),
      );
    }


    Future <void> submitData() async {
      final title = titleController.text;
      final description = descriptionController.text;
      if (titleController.text.isEmpty) {
        Utils.snackBar('please enter your notes first', context);
      } else if (descriptionController.text.isEmpty) {
        Utils.snackBar('please enter description', context);
      } else {
        dynamic data = {
          "title": title,
          "description": description,
          "is_completed": false
        };
        postDataViewModal.postTodoApi(data);
      }

    }


}
