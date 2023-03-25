import 'package:flutter/material.dart';

import '../../shared/components/constants.dart';

class LikedBooksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            'liked books',
          ),
        ),
      ),
    );
  }
}
