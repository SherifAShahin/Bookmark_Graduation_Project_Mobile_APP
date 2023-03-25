import 'package:bloc/bloc.dart';
import 'package:bookmarkapp/github.dart';
import 'package:bookmarkapp/modules/getstarted/getstarted_screen.dart';
import 'package:bookmarkapp/shared/cubit/cubit_observer.dart';
import 'package:flutter/material.dart';

void main()
{
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
      home: GitHubScreen(),
    );
  }
}
