import 'package:courier_management_system/core/model/CatsModal.dart';
import 'package:courier_management_system/ui/viewModel/CatsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CatsView extends StatefulWidget {
  const CatsView({super.key});

  @override
  State<CatsView> createState() => _CatsViewState();
}
TextEditingController _catsController = TextEditingController();

class _CatsViewState extends State<CatsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Cats Home'),
      ),
      body: Column(
        children: [
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 14),
            child: TextFormField(
              controller: _catsController,
              decoration:const InputDecoration(
                // border: InputBorder.none,
                hintText: "Search Cats ",
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: (){
              CatsViewModel().fetchCatsApi(_catsController.text);
            },
            child: Container(

              height: 30,
              width: 100,
              child:const Text('Search'),
            ),
          ),
          Consumer<CatsViewModel>(builder: (context, modal, _){
            return Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index){
                return Card(
                  child: Text(modal.apiResponse.data != null ? modal.apiResponse.data!.name.toString() : "wait"),
                );
              }),
            );

          },)
        ],
      ),
    );
  }
}

