import 'dart:async';
import 'package:courier_management_system/ui/view/updateTodo.dart';
import 'package:courier_management_system/ui/viewModel/deleteDataViewModel.dart';
import 'package:courier_management_system/ui/viewModel/fetchDataViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/data/response/status.dart';
import '../../core/utils/routes/routes_name.dart';

class ToDoListView extends StatefulWidget {
  const ToDoListView({super.key});

  @override
  State<ToDoListView> createState() => _ToDoListViewState();
}

DeleteDataViewModel _deleteDataViewModel = DeleteDataViewModel();

class _ToDoListViewState extends State<ToDoListView> {



  var provider;



  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      provider = Provider.of<FetchDataViewModel>(context, listen: false);
      await provider.fetchToDoApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes List'),
      ),
      body: Consumer<FetchDataViewModel>(builder: (context, model, _) {
          switch (model.toDoDataApiResponse.status) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(
                  child: Text(model.toDoDataApiResponse.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: model.toDoDataApiResponse.data?.items?.length,
                  itemBuilder: (context, index) {
                    final id = model.toDoDataApiResponse.data!.items?[index].sId
                        as String;
                    print(id);
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(child: Text('${index + 1}')),
                        title: Text(model
                            .toDoDataApiResponse.data!.items![index].title
                            .toString()),
                        subtitle: Text(model
                            .toDoDataApiResponse.data!.items![index].description
                            .toString()),
                        trailing: PopupMenuButton(
                          onSelected: (value) {
                            if (value == 'edit') {
                              String title = model
                                  .toDoDataApiResponse.data!.items![index].title
                                  .toString();
                              String description = model.toDoDataApiResponse
                                  .data!.items![index].description
                                  .toString();
                              // open the edit page
                              NaviagetToEditPage(title, description, id);
                            } else if (value == 'delete') {
                              // delete and remove the item
                              _deleteDataViewModel.fetchdeleteApibyId(id);

                              // This code is refreshing the page
                              Navigator.of(context).pop();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (BuildContext context) => ToDoListView()));
                            }
                          },
                          itemBuilder: (context) {
                            return const [
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
                  });
            default:
              const Text('');
          }
          return Container(
            child: Text('no data '),
          );
        }),
      // ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.addTodo);
          },
          label: Text('Add Notes')),
    );
  }

  Future<void> NaviagetToEditPage(
      String title, String description, String id) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              UpdateTodoView(title: title, description: description, id: id),
        ));
  }
}
