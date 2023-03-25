import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';

class BookItemScreen extends StatelessWidget {

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
                Container(
                  // margin: EdgeInsets.symmetric(
                  //   horizontal: 15.0,
                  //   vertical: 25.0,
                  // ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      20.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Image(
                              image: AssetImage('assets/images/book.png'),
                              fit: BoxFit.fill,
                              width: 233.0,
                              height: 308.3,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children:
                                [
                                  IconButton(
                                    onPressed: ()
                                    {

                                    },
                                    icon: Icon(
                                      Ionicons.heart_outline,
                                      size: 50.0,
                                      color: HexColor(
                                        '#045255',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  IconButton(
                                      onPressed: ()
                                      {

                                      },
                                      icon: Icon(
                                        Ionicons.archive_outline,
                                        size: 50.0,
                                        color: HexColor(
                                          '#045255',
                                        ),
                                      ),
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  IconButton(
                                      onPressed: ()
                                      {

                                      },
                                      icon: Icon(
                                        Ionicons.share_social_outline,
                                        size: 50.0,
                                        color: HexColor(
                                          '#045255',
                                        ),
                                      ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Clean Code For Beginners',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 28.0
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        RichText(
                            text: TextSpan(
                                children:
                                [
                                  TextSpan(
                                    text: "Author: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 25.0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "author name",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 25.0,
                                    ),
                                  )
                                ]
                            )
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        RichText(
                            text: TextSpan(
                                children:
                                [
                                  TextSpan(
                                    text: "Genre: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 25.0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "book genre",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 25.0,
                                    ),
                                  )
                                ]
                            )
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        RichText(
                            text: TextSpan(
                                children:
                                [
                                  TextSpan(
                                    text: "Description: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 25.0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "book description",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 25.0,
                                    ),
                                  )
                                ]
                            )
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children:
                          [
                            Text(
                              'Rating: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25.0
                              ),
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
                                color: HexColor(
                                  '#045255',
                                ),
                              ),
                              onRatingUpdate: (rating)
                              {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
