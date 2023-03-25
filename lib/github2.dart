import 'package:bookmarkapp/github.dart';
import 'package:bookmarkapp/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 25.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                booksItemDetailBuilder(
                    model: model,
                  heartIconOnPressed: ()
                  {
                    print('heart pressed!');
                  },
                  archiveIconOnPressed: ()
                  {
                    print('archive pressed!');
                  },
                  shareIconOnPressed: ()
                  {
                    print('share pressed!');
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  'Books you may like:',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25.0
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                SizedBox(
                  height: 320.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => MaterialButton(
                      padding: EdgeInsetsDirectional.all(
                        0.0,
                      ),
                      onPressed: ()
                      {

                      },
                      child: Container(
                        width: 216.0,
                        padding: EdgeInsetsDirectional.all(
                          20.0,
                        ),
                        decoration: BoxDecoration(
                          color: HexColor(
                            '#045255',
                          ).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(
                            15.0,
                          ),
                        ),
                        child: Column(
                          children:
                          [
                            Image(
                              image: AssetImage('assets/images/book.png'),
                              fit: BoxFit.fill,
                              width: 115.6,
                              height: 153.0,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Container(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                "Clean Code for Beginners",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style: TextStyle(
                                    color:  Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 25.0
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Container(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                "author name",
                                style: TextStyle(
                                    color:  Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20.0
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Container(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                "book genre",
                                style: TextStyle(
                                    color:  Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20.0
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            RatingBar.builder(
                              itemSize: 25.0,
                              initialRating: 3.0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating)
                              {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 30.0,
                    ),
                    itemCount: 15,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
