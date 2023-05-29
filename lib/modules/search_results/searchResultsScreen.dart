import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../../main.dart';
import '../book_item/bookItemScreen.dart';

class SearchResultsScreen extends StatelessWidget {
  BookMarkCubit? cubit;
  final BuildContext buildContext;
  SearchResultsScreen(
      this.cubit,
      this.buildContext,
      );

  Widget nullCheck({
  Widget? scaffold,
})
  {
    if(cubit?.recommendedBooks?.isEmpty ?? true)
    {
      cubit?.refresh();
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
              Navigator.pop(buildContext);
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
          child: Center(
            child: Text(
              'Book is not found!',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }
    else
    {
      return scaffold!;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(cubit?.recommendedBooks);
    var list = cubit?.recommendedBooks;

    return nullCheck(
      scaffold: Scaffold(
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
          actions:
          [
            IconButton(
              onPressed: ()
              {
                print('icon pressed');
                print(cubit?.recommendedBooks);
              },
              icon: Icon(
                Icons.refresh,
                size: 30.0,
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
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => MaterialButton(
              padding: EdgeInsetsDirectional.all(
                0.0,
              ),
              onPressed: ()
              {
                recommendedBooksModel(
                    title: list?[index]['title'],
                    author: list?[index]['author'],
                    imageUrl: list?[index]['image_url'],
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => BookItemScreen(
                      recommendedBooksModel(
                          title: list?[index]['title'],
                          author: list?[index]['author'],
                          imageUrl: list?[index]['image_url']
                      ),
                      cubit,
                      context,
                    ),
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
                              list?[index]['title'],
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
                                list?[index]['author'],
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
            itemCount: list?.length,
          ),
        ),
      ),
    );
  }
}

//The Queen of the Damned (Vampire Chronicles (Paperback))
//
// Politically Correct Bedtime Stories: Modern Tales for Our Life and Times
//
// Angels
//
// The Boy Next Door
//
// Men Are from Mars
//
// Divine Secrets of the Ya-Ya Sisterhood : A Novel