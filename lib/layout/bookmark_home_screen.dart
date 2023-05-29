import 'dart:ui';
import 'package:bookmarkapp/modules/liked_books/liked_books_screen.dart';
import 'package:bookmarkapp/modules/search_results/searchResultsScreen.dart';
import 'package:bookmarkapp/modules/will_read/will_read_screen.dart';
import 'package:bookmarkapp/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../modules/recommended/recommended_screen.dart';
import '../shared/components/components.dart';

class HomeScreen extends StatelessWidget {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var bookSearchKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookMarkCubit()..getRandomBooksData(),
      child: BlocConsumer<BookMarkCubit, BookMarkStates>(
        listener: (context, state) {
          if (state is BookMarkGetRandomBooksDataErrorState)
            BookMarkCubit.get(context).getRandomBooksData();
        },
        builder: (context, state) {
          BookMarkCubit cubit = BlocProvider.of(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                'BookMark',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              leading: null,
              automaticallyImplyLeading: false,
              actions:
              [
                IconButton(
                  onPressed: (){
                    print('reload button pressed');
                    cubit.randomBooks = [];
                    cubit.getRandomBooksData();
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
            body: cubit.screens[cubit.currentIndex],
            floatingActionButton: FloatingActionButton(
              onPressed: () async{
                if(cubit.isBottomSheetOn)
                {
                  if(bookSearchKey.currentState!.validate())
                  {
                    BookMarkCubit? cubit = context.read<BookMarkCubit>();
                    await cubit.getRecommendedBooksData(
                      title: cubit.bookTitleController.text,
                    );
                    print(cubit.recommendedBooks);
                    print(cubit.bookTitleController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SearchResultsScreen(
                          cubit,
                          context,
                        ),
                      ),
                    );
                    cubit.bottomSheetChangeState(
                      Icons.arrow_forward,
                      true,
                    );
                    // cubit.currentIndex = 3;
                  }
                }
                else
                {
                  cubit.bottomSheetChangeState(
                    Icons.arrow_forward,
                    true,
                  );
                  // showModalBottomSheet(
                  //   backgroundColor: Colors.transparent,
                  //   barrierColor: Colors.transparent,
                  //   context: context,
                  //   builder: (context) => Container(
                  //     height: 250.0,
                  //     decoration: BoxDecoration(
                  //       color: Colors.blue.withOpacity(0.4),
                  //     ),
                  //   ),
                  // );
                  // isBottomSheetOn = false;
                  scaffoldKey.currentState!.showBottomSheet(
                    backgroundColor: Colors.transparent,
                        (context) => Container(
                          padding: EdgeInsets.all(20.0),
                          color: HexColor(
                        '#045255',
                      ).withOpacity(
                            0.5,
                          ),
                          child: Form(
                            key: bookSearchKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children:
                              [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      15.0,
                                    ),
                                  ),
                                  child: defaultTextFormField(
                                    controller: cubit.bookTitleController,
                                    keyboardType: TextInputType.text,
                                    label: 'Book title',
                                    isPassword: false,
                                    borderRadius: 15.0,
                                    validate: (value)
                                    {
                                      if(value!.isEmpty)
                                      {
                                        return 'book title should not be empty';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                    ),
                  ).closed.then((value)
                  {
                    cubit.bottomSheetChangeState(
                      Icons.search,
                      false,
                    );
                  });
                }
              },
              backgroundColor: HexColor(
                '#045255',
              ),
              child: Icon(
                cubit.fabIcon,
                size: 35.0,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: cubit.currentIndex,
              selectedItemColor: HexColor(
                '#e3c099',
              ),
              unselectedItemColor: Colors.white,
              backgroundColor: HexColor(
                '#045255',
              ),
              type: BottomNavigationBarType.fixed,
              onTap: (index){
                cubit.currentIndex = index;
                cubit.bottomNavbarChangeState(index);
                print(index);
              },
              items:
              [
                BottomNavigationBarItem(
                    icon: Icon(
                      Ionicons.albums,
                      size: 35.0,
                    ),
                    label: 'Recommended',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Ionicons.archive,
                    size: 35.0,
                  ),
                  label: 'Will Read',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Ionicons.heart,
                    size: 35.0,
                  ),
                  label: 'Liked',
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(
                //     Ionicons.search,
                //     size: 35.0,
                //   ),
                //   label: 'Search',
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
