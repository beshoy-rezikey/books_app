part of 'similar_books_cubit.dart';

@immutable
abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}
class SimilarBooksLoading extends SimilarBooksState {}
class SimilarBooksSuccess extends SimilarBooksState {
   final List<BookModel> books ;

  SimilarBooksSuccess(this.books);
}
class SimilarBooksError extends SimilarBooksState {
   final String errorMessage;

  SimilarBooksError(this.errorMessage);
}

