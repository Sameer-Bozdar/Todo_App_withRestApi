import 'dart:convert';
import 'package:courier_management_system/core/utils/utils.dart';
import 'package:courier_management_system/ui/view/add_todoView.dart';
import 'package:courier_management_system/ui/viewModel/ToDoViewModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../core/data/response/status.dart';

class ToDoListView extends StatefulWidget {
  const ToDoListView({super.key});

  @override
  State<ToDoListView> createState() => _ToDoListViewState();
}

class _ToDoListViewState extends State<ToDoListView> {
  // List items = [];





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes List'),
      ),
      body:  Column(
          children:[
         Consumer<ToDoViewModel>(
            builder: (context, value, _) {
              if (kDebugMode) {
                print(value.toDoDataApiResponse.status);
              }
          switch (value.toDoDataApiResponse.status) {
            case Status.LOADING:
              return const Center(child: Text('loading'));
            case Status.ERROR:
              return Center(
                  child: Text(value.toDoDataApiResponse.message.toString()));
            case Status.COMPLETED:
              return Column(
                  children: [
                    ListView.builder(
                        padding: EdgeInsets.all(8),
                        // itemCount: value.toDoDataApiResponse.data?.items?.length,
                        itemBuilder: (context, index) {
                          // final item = value.toDoDataApiResponse.data!.items![index] as Map;
                          // final id = item['_id'] as String;
                          // print(item.length);
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(child: Text('${index + 1}')),
                              // title: Text(value.toDoDataApiResponse.data!.items![index].title.toString()),
                              // subtitle: Text(value.toDoDataApiResponse.data!.items![index].description.toString()),
                              trailing: PopupMenuButton(
                                onSelected: (value) {
                                  if (value == 'edit') {
                                    // open the edit page
                                    // NaviagetToEditPage(item);
                                  } else if (value == 'delete') {
                                    // delete and remove the item
                                    // deletByid(id);
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
                  ]);
            default:
              const Text('');
          }
          return Container(
            child: Text('no data '),
          );
        }),
        ]),
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
    // fetchData();
  }

  Future<void> NaviagetToAddPage() async {
    final route = MaterialPageRoute(
      builder: (context) => AddTodoView(),
    );
    await Navigator.push(context, route);

    // fetchData();
  }
/// services
  Future<void> deletByid(String id) async {
    try {
      final url = 'https://api.nstack.in/v1/todos/$id';
      final uri = Uri.parse(url);

      final response = await http.delete(uri);

      if (response.statusCode == 200) {
        Utils.snackBar('Deleted', context);
        // final filtered =
            // items.where((element) => element['_id'] != id).toList();
        // setState(() {
        //   items = filtered;
        // });
      }
    } catch (e) {
      print('error delting item:  $e');
    }
  }
///services
//   Future<void> fetchData() async {
//     try {
//       setState(() {
//         loading = true;
//       });
//       /// created a model for response
//       final url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
//       final uri = Uri.parse(url);
//       var response = await http.get(uri);
//
//       if (response.statusCode == 200) {
//         ///View model
//         setState(() {
//           loading = false;
//         });
//         ///
//         /// return model model
//         ///
//         Map json = jsonDecode(response.body);
//         final result = json['items'] as List;
//         setState(() {
//           items = result;
//         });
//       }
//
//       print(response.statusCode);
//       print(response.body);
//     } catch (e) {
//       setState(() {
//         loading = false; // Make sure loading is set to false on error too.
//       });
//       print(e.toString());
//     }
//   }
}
