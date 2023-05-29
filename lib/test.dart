import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Book {
  final String author;
  final String imageUrl;
  final String title;

  Book({required this.author, required this.imageUrl, required this.title});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      author: json['author'],
      imageUrl: json['image_url'],
      title: json['title'],
    );
  }
}

class BookListPage extends StatefulWidget {
  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  List<Book>? books;

  @override
  void initState() {
    super.initState();
    _fetchBooks();
  }

  Future<void> _fetchBooks() async {
    final response = await http.get(Uri.parse('http://localhost:5000/recommend?title=Angels'));
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body)['recommended_books'] as List<dynamic>;
      final bookList = jsonList.map((json) => Book.fromJson(json)).toList();
      setState(() {
        books = bookList;
      });
    } else {
      throw Exception('Failed to load books');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommended Books'),
      ),
      body: books == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: books!.length,
        itemBuilder: (context, index) {
          final book = books![index];
          return ListTile(
            leading: Image.network(book.imageUrl),
            title: Text(book.title),
            subtitle: Text(book.author),
          );
        },
      ),
    );
  }
}