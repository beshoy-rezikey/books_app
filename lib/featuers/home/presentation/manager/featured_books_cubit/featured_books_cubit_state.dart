part of 'featured_books_cubit_cubit.dart';

@immutable
abstract class FeaturedBooksCubitState {}

class FeaturedBooksCubitInitial extends FeaturedBooksCubitState {}

class FeaturedBooksCubitLoading extends FeaturedBooksCubitState {}

class FeaturedBooksCubitFaluire extends FeaturedBooksCubitState {
  final String errorMessage;

  FeaturedBooksCubitFaluire(this.errorMessage);
}

class FeaturedBooksCubitSuccsess extends FeaturedBooksCubitState {
  final List<BookModel> books;

  FeaturedBooksCubitSuccsess(this.books);
}
