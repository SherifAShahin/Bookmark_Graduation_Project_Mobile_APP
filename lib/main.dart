import 'package:bloc/bloc.dart';
import 'package:bookmarkapp/github.dart';
import 'package:bookmarkapp/layout/bookmark_home_screen.dart';
import 'package:bookmarkapp/modules/getstarted/getstarted_screen.dart';
import 'package:bookmarkapp/test.dart';
import 'package:flutter/material.dart';

import 'cubit/cubit_observer.dart';

class recommendedBooksModel
{
  final String author;
  final String imageUrl;
  final String title;

  recommendedBooksModel({
    required this.author,
    required this.imageUrl,
    required this.title,
  });

  factory recommendedBooksModel.fromJson(Map<String, dynamic> json) {
    return recommendedBooksModel(
      author: json['author'],
      imageUrl: json['image_url'],
      title: json['title'],
    );
  }
}

void main() async {

  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
