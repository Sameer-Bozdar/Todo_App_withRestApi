import 'dart:convert';

import 'package:courier_management_system/core/utils/routes/routes_name.dart';
import 'package:courier_management_system/core/utils/utils.dart';
import 'package:courier_management_system/ui/view/add_todoView.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ToDoListView extends StatefulWidget {
  const ToDoListView({super.key});

  @override
  State<ToDoListView> createState() => _ToDoListViewState();
}

class _ToDoListViewState extends State<ToDoListView> {
  List items = [];
  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes List'),
      ),
      body: Visibility(
        visible: loading,
        child: Center(child: CircularProgressIndicator()),
        replacement: RefreshIndicator(
          onRefresh: fetchData,
          child: Visibility(
            visible: items.isNotEmpty,
              replacement: Center(child: Text('No Todo Item',style: Theme.of(context).textTheme.headline3),),
            child :ListView.builder(
              padding: EdgeInsets.all(8),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index] as Map;
                  final id = item['_id'] as String;

                  return Card(
                    
                    child: ListTile(
                      leading: CircleAvatar(child: Text('${index + 1}')),
                      title: Text(item['title']),
                      subtitle: Text(item['description']),
                      trailing: PopupMenuButton(
                        onSelected: (value) {
                          if (value == 'edit') {
                            // open the edit page
                            NaviagetToEditPage(item);
                          } else if (value == 'delete') {
                            // delete and remove the item
                            deletByid(id);
                          }
                        },
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              child: Text('Edit'),
                              value: 'edit',
                            ),
                            PopupMenuItem(
                              child: Text('Delete'),
                              value: 'delete',
                            ),
                          ];
                        },
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            NaviagetToAddPage();
          },
          label: Text('Add Notes')),
    );
  }

  Future<void> NaviagetToEditPage(Map item) async {
    final route = MaterialPageRoute(
      builder: (context) => AddTodoView(todo: item),
    );
    await Navigator.push(context, route);
    setState(() {
      loading = true;
    });
    fetchData();
  }

  Future<void> NaviagetToAddPage() async {
    final route = MaterialPageRoute(
      builder: (context) => AddTodoView(),
    );
    await Navigator.push(context, route);
    setState(() {
      loading = true;
    });
    fetchData();
  }

  Future<void> deletByid(String id) async {
    try {
      final url = 'https://api.nstack.in/v1/todos/$id';
      final uri = Uri.parse(url);

      final response = await http.delete(uri);

      if (response.statusCode == 200) {
        Utils.snackBar('Deleted', context);
        final filtered =
            items.where((element) => element['_id'] != id).toList();
        setState(() {
          items = filtered;
        });
      }
    } catch (e) {
      print('error delting item:  $e');
    }
  }

  Future<void> fetchData() async {
    try {
      setState(() {
        loading = true;
      });
      final url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
      final uri = Uri.parse(url);
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        setState(() {
          loading = false;
        });
        Map json = jsonDecode(response.body);
        final result = json['items'] as List;
        setState(() {
          items = result;
        });
      }

      print(response.statusCode);
      print(response.body);
    } catch (e) {
      setState(() {
        loading = false; // Make sure loading is set to false on error too.
      });
      print(e.toString());
    }
  }
}
