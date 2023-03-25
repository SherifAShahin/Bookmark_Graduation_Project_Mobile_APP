import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';

import '../book_item/bookItemScreen.dart';

class SearchResultsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Text(
          'Search Results',
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
        child: ListView.builder(
          itemBuilder: (context, index) => MaterialButton(
            padding: EdgeInsetsDirectional.all(
              0.0,
            ),
            onPressed: ()
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => BookItemScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 27.0,
              ),
              child: Container(
                height: 202.0,
                width: double.infinity,
                padding: EdgeInsetsDirectional.all(
                  20.0,
                ),
                margin: EdgeInsetsDirectional.symmetric(
                  horizontal: 15.0,
                ),
                decoration: BoxDecoration(
                  color: HexColor(
                    '#045255',
                  ).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(
                    15.0,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Image(
                      image: AssetImage('assets/images/book.png'),
                      fit: BoxFit.fill,
                      width: 115.6,
                    ),
                    SizedBox(
                      width: 21.4,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Clean Code for beginners',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 25.0,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: 5.0,
                            ),
                            child: Text(
                              'author name',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: 5.0,
                            ),
                            child: Text(
                              'book genre',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: RatingBar.builder(
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          itemCount: 6,
        ),
      ),
    );
  }
}
