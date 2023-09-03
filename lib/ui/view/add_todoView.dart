import 'dart:convert';

import 'package:courier_management_system/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddTodoView extends StatefulWidget {

  final Map? todo;

  const AddTodoView({super.key,this.todo});

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  bool isEdit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final todo = widget.todo;
    if(todo != null){
      isEdit = true;
    final title = todo['title'];
      final description = todo['description'];

      titleController.text = title;
      descriptionController.text = description;



    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(isEdit ?'Edit todo' : 'Add Notes' )),
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
              isEdit ? UpdateData() : submitData();
              },
              child:  Padding(
                padding: const EdgeInsets.all(16),
                child: Text(isEdit ?  'Update' : 'Submit'),
              ))
        ],
      ),
    );
  }

  Future<void> UpdateData()async{
    final title = titleController.text;
    final description = descriptionController.text;

    final todo = widget.todo;
    final id = todo?['_id'];
    if(todo == null){
      print('you can not call updated without todo data');
      return;
    }

    final body = {
      "title": title,
      "description": description,
      "is_completed": false
    };
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.put(uri, body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
    });
    if(response.statusCode == 200){
      Utils.snackBar('Updated', context);
    }else{
      Utils.snackBar('Error', context);
    }

  }

  Future<void> submitData() async {
    final title = titleController.text;
    final description = descriptionController.text;

    final body = {
      "title": title,
      "description": description,
      "is_completed": false
    };
    final url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.post(uri, body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 201) {
      titleController.text = '';
      descriptionController.text = '';
      Utils.snackBar('Creation Success', context);
      print('Creation Success');
    } else {
      Utils.snackBar('Creation Failed', context);
      print('Creation Failed');
    }
  }
}
