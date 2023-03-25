import 'package:bookmarkapp/github2.dart';
import 'package:bookmarkapp/shared/components/components.dart';
import 'package:flutter/material.dart';

class GitHubScreen extends StatelessWidget {

  List<BookModel> model = [
    BookModel(
      image: 'https://stacksecrets.com/wp-content/uploads/2022/03/Flutter-Recipes-pdf.jpg',
      title : 'Flutter Recipes',
      author : 'Fu Cheng',
      genre : 'book genre',
      description: 'Take advantage of this comprehensive reference to solving common problems when developing with Flutter. Along with an introduction to the basic concepts of Flutter development, the recipes in this book cover all important aspects of this emerging technology, including development, testing, debugging, performance tuning, app publishing, and continuous integration. ',
    ),
    BookModel(
      image : 'https://stacksecrets.com/wp-content/uploads/2022/03/Flutter-for-Beginners-pdf.jpg',
      title : 'Flutter for Beginners',
      author : 'Alessandro Biessek',
      genre : 'book genre',
    ),
    BookModel(
      image: 'https://stacksecrets.com/wp-content/uploads/2022/03/Pragmatic-Flutter-pdf.jpg',
      title : 'Pragmatic Flutter',
      author : 'Priyanka Tyagi',
      genre : 'book genre',
    ),
    BookModel(
      image: 'https://stacksecrets.com/wp-content/uploads/2022/03/Flutter-Recipes-pdf.jpg',
      title : 'Flutter Recipes',
      author : 'Fu Cheng',
      genre : 'book genre',
    ),
    BookModel(
      image : 'https://stacksecrets.com/wp-content/uploads/2022/03/Flutter-for-Beginners-pdf.jpg',
      title : 'Flutter for Beginners',
      author : 'Alessandro Biessek',
      genre : 'book genre',
    ),
    BookModel(
      image: 'https://stacksecrets.com/wp-content/uploads/2022/03/Pragmatic-Flutter-pdf.jpg',
      title : 'Pragmatic Flutter',
      author : 'Priyanka Tyagi',
      genre : 'book genre',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: bookItemListBuilder(
          model: model,
        ),
      ),
    );
  }
}

class BookModel {
  final String image;
  final String title;
  final String author;
  final String genre;
  final String? description;

  BookModel({
    required this.image,
    required this.title,
    required this.author,
    required this.genre,
    this.description,
});
}