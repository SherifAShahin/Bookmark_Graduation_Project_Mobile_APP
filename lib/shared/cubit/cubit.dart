import 'package:bloc/bloc.dart';
import 'package:bookmarkapp/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/liked_books/liked_books_screen.dart';
import '../../modules/recommended/recommended_screen.dart';
import '../../modules/will_read/will_read_screen.dart';

class BookMarkCubit extends Cubit<BookMarkStates>
{
  BookMarkCubit() : super(BookMarkInitialState());

  BookMarkCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    RecommendedScreen(),
    WillReadScreen(),
    LikedBooksScreen(),
  ];

  var bookTitleController = TextEditingController();
  var bookGenreController = TextEditingController();

  void bottomNavbarChangeState(int index)
  {
    emit(BookMarkBottomNavbarChangeState());
  }


  IconData fabIcon = Icons.search;
  bool isBottomSheetOn = false;
  void bottomSheetChangeState(IconData icon, bool isOn)
  {
    fabIcon = icon;
    isBottomSheetOn = isOn;
    emit(BookMarkBottomSheetChangeState());
  }
}