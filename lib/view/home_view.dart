import 'package:courier_management_system/data/response/status.dart';
import 'package:courier_management_system/res/components/round_button.dart';
import 'package:courier_management_system/utils/routes/routes_name.dart';
import 'package:courier_management_system/view/image_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:provider/provider.dart';
import '../model/ImageModel.dart';
import '../view_model/home_view_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController valueController = TextEditingController();

  String noImage = 'abc';
  List<Hits>? hits;
  HomeviewViewModel pixabayImageViewViewModel = HomeviewViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeviewModel = Provider.of<HomeviewViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'HomePage',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: Colors.teal,
        actions: [
          InkWell(
            onTap: () {
              // userPreferences.remove().then((value) {
              //   Navigator.pushNamed(context, RoutesName.login);
              // });
            },
            child: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                TextFormField(
                  controller: valueController,
                  decoration: InputDecoration(hintText: 'Seacrh Image'),
                ),
                SizedBox(
                  height: 20,
                ),
                RoundButton(
                    title: 'Search',
                    loading: HomeviewModel.loading,
                    onPress: () {
                      print('api hit in button');

                      Map data = {
                        'value': valueController.text.toString(),
                      };
                      HomeviewModel.fetchRandomImageApi(data, context);
                      // if(_emailController.text.isEmpty){
                      //   Utils.snackBar('Please Enter Email', context);
                      // }else if(_passwordController.text.isEmpty){
                      //   Utils.snackBar('Please Enter Your Password', context);
                      // }else if(_passwordController.text.length < 6 ){
                      //   Utils.snackBar('Please Enter 6 digit Password', context);
                      //
                      // }else{

                      // authViewModel.loginApi(data, context);
                      // print('Api Hit');
                    })
              ],
            ),
            Column(
              children: [
                Consumer<HomeviewViewModel>(
                  builder: (context, value, _) {
                    if (kDebugMode) {
                      print(value.pixabayImages.status);
                    }

                    switch (value.pixabayImages.status) {
                      case Status.LOADING:
                        return const Center(child: CircularProgressIndicator());

                      case Status.ERROR:
                        return Center(
                            child:
                                Text(value.pixabayImages.message.toString()));
                      case Status.COMPLETED:
                        return SizedBox(
                            height: 500,
                            child: GridView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,

                                        ),

                                itemCount:
                                    value.pixabayImages.data?.hits?.length,
                                itemBuilder: (context, index) {
                                  print(value.pixabayImages.data?.hits);
                                  // return Text('pakistan');
                                  return Image.network(
                                      // value.pixabayImages.data?.hits![index].id == null || value.pixabayImages.data?.hits![index].pageURL == null ? noImage:
                                      value.pixabayImages.data!.hits![index]
                                          .largeImageURL
                                          .toString());
                                }));

                      default:
                        const Text('');
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// if(value.moviesList.status == Status.LOADING){
//   return CircularProgressIndicator();
// }else if(value.moviesList.status == Status.ERROR){
//   return Text(value.moviesList.message.toString());
//
// }else if(value.moviesList.status == Status.COMPLETED){
//   return Text('Data');
// }
