import 'package:bookmarkapp/github.dart';
import 'package:bookmarkapp/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class GitHubScreen2 extends StatelessWidget {
  BookModel model;

  GitHubScreen2(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Text(
          'BookMark',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          onPressed: ()
          {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        backgroundColor: HexColor(
          '#045255',
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: booksItemDetailBuilder(
            model: model,
            heartIconOnPressed: ()
            {

            },
            archiveIconOnPressed: ()
            {

            },
            shareIconOnPressed: ()
            {

            }
        ),
      ),
    );
  }
}
