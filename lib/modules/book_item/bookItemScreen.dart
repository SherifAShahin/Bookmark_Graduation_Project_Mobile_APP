import 'package:bookmarkapp/cubit/cubit.dart';
import 'package:bookmarkapp/cubit/states.dart';
import 'package:bookmarkapp/modules/search_results/searchResultsScreen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';
import '../../main.dart';

class BookItemScreen extends StatefulWidget {
  recommendedBooksModel model;
  BookMarkCubit? cubit;
  final BuildContext buildContext;
  BookItemScreen(
      this.model,
      this.cubit,
      this.buildContext,
      );

  @override
  State<BookItemScreen> createState() => _BookItemScreenState();
}

class _BookItemScreenState extends State<BookItemScreen> {
  bool refresh = false;

  @override
  void initState() {
    super.initState();
    // Set the condition to true after 5 seconds
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        refresh = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    setState(()
    {
      widget.cubit?.getYouMayLikeBooksData(
        title: widget.model.title,
      );
    });

    return ConditionalBuilder(
        condition: true,
        builder: (context) => Scaffold(
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
            actions:
            [
              IconButton(
                onPressed: (){
                  setState(()
                  {
                    print('reload button pressed');
                  });
                },
                icon: Icon(
                  Icons.refresh,
                  size: 35.0,
                ),
              ),
            ],
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
              physics: BouncingScrollPhysics(),
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
                                MaterialButton(
                                  onPressed: ()
                                  {
                                    print('book img pressed');
                                  },
                                  child: Image(
                                    image: AssetImage('assets/images/book.png'),
                                    fit: BoxFit.fill,
                                    width: 233.0,
                                    height: 308.3,
                                  ),
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
                                          widget.cubit!.likedBooks!.add({
                                            'title': widget.model.title,
                                            'author': widget.model.author,
                                            'image_url': widget.model.imageUrl,
                                          });
                                          print(widget.cubit!.likedBooks);
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
                                          widget.cubit!.archivedBooks!.add({
                                            'title': widget.model.title,
                                            'author': widget.model.author,
                                            'image_url': widget.model.imageUrl,
                                          });
                                          print(widget.cubit!.archivedBooks);
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
                              widget.model.title,
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
                                        text: widget.model.author,
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
                    ConditionalBuilder(
                        condition: refresh,
                        builder: (context) => SizedBox(
                          height: 320.0,
                          child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => MaterialButton(
                              padding: EdgeInsetsDirectional.all(
                                0.0,
                              ),
                              onPressed: ()
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => BookItemScreen(
                                      recommendedBooksModel(
                                          title: widget.cubit!.recommendedBooks![index]['title'],
                                          author: widget.cubit!.recommendedBooks![index]['author'],
                                          imageUrl: widget.cubit!.recommendedBooks![index]['image_url']
                                      ),
                                      widget.cubit,
                                      context,
                                    ),
                                  ),
                                );
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
                                        widget.cubit!.recommendedBooks![index]['title'],
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
                                        widget.cubit!.recommendedBooks![index]['author'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
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
                            itemCount: widget.cubit!.recommendedBooks!.length,
                          ),
                        ),
                        fallback: (context) => SizedBox(
                          height: 320.0,
                          child: SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: Center(child: CircularProgressIndicator(
                              color: HexColor(
                                '#045255',
                              ),
                            )),
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        fallback: (context) => Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(child: CircularProgressIndicator(
            color: HexColor(
              '#045255',
            ),
          )),
        ),
    );
  }
}
