import 'package:courier_management_system/model/ImageModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ImageView extends StatefulWidget {

  ImageModel model;
  BoxFit imageBoxFit;

   ImageView({super.key, required this.model, required this.imageBoxFit});

  @override
  State<ImageView> createState() => _ImageViewState();
}
class _ImageViewState extends State<ImageView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text('data'),
),
    );
  }
}
