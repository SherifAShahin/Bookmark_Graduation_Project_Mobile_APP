import 'package:bookmarkapp/cubit/cubit.dart';
import 'package:bookmarkapp/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../main.dart';
import '../../shared/components/constants.dart';
import '../book_item/bookItemScreen.dart';

class WillReadScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookMarkCubit, BookMarkStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        BookMarkCubit cubit = BlocProvider.of(context);
        var list = cubit.archivedBooks;

        return Scaffold(
          body: ConditionalBuilder(
            condition: list!.length == 0,
            builder: (context) => Container(
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
                  'There is no archived books',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            fallback: (context) => Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: backgroundImage,
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Dismissible(
                    key: Key(list![index]['title'].toString()),
                    onDismissed: (direction)
                    {
                      list.removeAt(index);
                      cubit.refresh();
                    },
                    child: MaterialButton(
                      padding: EdgeInsetsDirectional.all(
                        0.0,
                      ),
                      onPressed: ()
                      {
                        recommendedBooksModel(
                            title: list?[index]['title'],
                            author: list?[index]['author'],
                            imageUrl: list?[index]['image_url']
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
                  ),
                  itemCount: list?.length,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
