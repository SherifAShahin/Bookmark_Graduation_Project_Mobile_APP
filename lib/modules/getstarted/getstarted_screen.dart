import 'package:bookmarkapp/modules/login/login_screen.dart';
import 'package:bookmarkapp/shared/components/components.dart';
import 'package:bookmarkapp/shared/components/constants.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: getStartedImage,
              fit: BoxFit.cover,
            )
        ),
        child: defaultNoteMessage(
          titleBold: 'Welcome ',
          titleRegular: 'to BookMark,',
          bodyText: 'BookMark’s goal is to improve your reading experience and make it easier to explore more books you would like.',
          endText: 'have a nice day ^_^',
          buttonText: 'Get Started',
          onPressed: ()
          {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginScreen(),
                ),
            );
          },
        ),
      ),
    );
  }
}