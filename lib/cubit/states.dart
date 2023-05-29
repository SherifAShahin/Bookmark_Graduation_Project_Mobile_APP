abstract class BookMarkStates {}

class BookMarkInitialState extends BookMarkStates {}

class BookMarkBottomNavbarChangeState extends BookMarkStates {}

class BookMarkBottomSheetChangeState extends BookMarkStates {
  bool get isEmpty => true;
}

class BookMarkGetRecommendedBooksDataLoadingState extends BookMarkStates {}

class BookMarkGetRecommendedBooksDataSuccessState extends BookMarkStates {}

class BookMarkGetRecommendedBooksDataErrorState extends BookMarkStates
{
  final String error;
  BookMarkGetRecommendedBooksDataErrorState(this.error);
}

class BookMarkGetRandomBooksDataLoadingState extends BookMarkStates {}

class BookMarkGetRandomBooksDataSuccessState extends BookMarkStates {}

class BookMarkGetRandomBooksDataErrorState extends BookMarkStates
{
  final String error;
  BookMarkGetRandomBooksDataErrorState(this.error);
}

class BookMarkRefreshState extends BookMarkStates {}