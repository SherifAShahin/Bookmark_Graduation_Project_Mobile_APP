import 'package:bloc/bloc.dart';
import 'package:bookmarkapp/cubit/states.dart';
import 'package:bookmarkapp/main.dart';
import 'package:bookmarkapp/modules/search_results/searchResultsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/liked_books/liked_books_screen.dart';
import '../../modules/recommended/recommended_screen.dart';
import '../../modules/will_read/will_read_screen.dart';
import '../../network/remote/dio_helper.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BookMarkCubit extends Cubit<BookMarkStates>
{
  BookMarkCubit() : super(BookMarkInitialState());

  static BookMarkCubit get(context) => BlocProvider.of(context);

  final bookmarkCubit = BookMarkCubit;
  bool get isEmpty => true;

  int currentIndex = 0;
  List<Widget> screens = [
    RecommendedScreen(),
    WillReadScreen(),
    LikedBooksScreen(),
    // SearchResultsScreen(),
  ];

  var bookTitleController = TextEditingController();

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

  List? recommendedBooks = [];
  String? errorMsg;

  Future getRecommendedBooksData({
    required String title,
  }) async
  {
    String apiUrl = 'http://10.0.2.2:5000/recommend?title=$title';
    print('####-- starting API --###');
    emit(BookMarkGetRecommendedBooksDataLoadingState());
    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200)
    {
      recommendedBooks = await json.decode(response.body)['recommended_books'];
      errorMsg = await json.decode(response.body)['error'];
      if(recommendedBooks?.isEmpty ?? true)
      {
        print(errorMsg);
      } else {
        print(recommendedBooks);
        print('####-- API Started Successfully --###');
        emit(BookMarkGetRecommendedBooksDataSuccessState());
      }
    }
    else
    {
      print('####-- Request failed with status: ${response.statusCode}. --###');
      emit(BookMarkGetRecommendedBooksDataErrorState(errorMsg.toString()));
    }
  }

  Future getYouMayLikeBooksData({
    required String title,
  }) async
  {
    String apiUrl = 'http://10.0.2.2:5000/you_may_like?title=$title';
    print('####-- starting API --###');
    emit(BookMarkGetRecommendedBooksDataLoadingState());
    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200)
    {
      recommendedBooks = await json.decode(response.body)['recommended_books'];
      errorMsg = await json.decode(response.body)['error'];
      if(recommendedBooks?.isEmpty ?? true)
      {
        print(errorMsg);
      } else {
        print(recommendedBooks);
        print('####-- API Started Successfully --###');
        emit(BookMarkGetRecommendedBooksDataSuccessState());
      }
    }
    else
    {
      print('####-- Request failed with status: ${response.statusCode}. --###');
      emit(BookMarkGetRecommendedBooksDataErrorState(errorMsg.toString()));
    }
  }

  List? randomBooks = [];

  Future getRandomBooksData() async
  {
    String apiUrl = 'http://10.0.2.2:5000/api/random_books';
    print('####-- starting API --###');
    emit(BookMarkGetRandomBooksDataLoadingState());
    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200)
    {
      randomBooks = json.decode(response.body)['random_books'];
      errorMsg = json.decode(response.body)['error'];
      if(randomBooks?.isEmpty ?? true)
      {
        print(errorMsg);
      } else {
        print(randomBooks);
        print('####-- API Started Successfully --###');
        emit(BookMarkGetRandomBooksDataSuccessState());
      }
    }
    else
    {
      print('####-- Request failed with status: ${response.statusCode}. --###');
      emit(BookMarkGetRandomBooksDataErrorState(errorMsg.toString()));
    }
  }

  void refresh()
  {
    emit(BookMarkRefreshState());
  }

  List<dynamic>? likedBooks = [];
  List<dynamic>? archivedBooks = [];

  //{
  //   "error": "The given book 'Angelss' does not exist"
  // }

  // void getRecommendedBooksData() async
  // {
  //   emit(BookMarkGetRecommendedBooksDataLoadingState());
  //   if(recommendedBooks.length == 0)
  //   {
  //     await DioHelper.getData(
  //       url: "recommend",
  //       query: {
  //         "title" : "Angels",
  //       },
  //     ).then((value)
  //     {
  //       print('data is here');
  //       recommendedBooks = value.data['recommended_books'];
  //       print(recommendedBooks);
  //       emit(BookMarkGetRecommendedBooksDataSuccessState());
  //     }).catchError((error)
  //     {
  //       print('####--- Error When Getting Business Data: ${error.data.toString()} ---###');
  //       emit(BookMarkGetRecommendedBooksDataErrorState(error.toString()));
  //     });
  //   } else
  //   {
  //     emit(BookMarkGetRecommendedBooksDataSuccessState());
  //   }
  // }
}