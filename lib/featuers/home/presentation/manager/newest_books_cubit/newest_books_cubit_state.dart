part of 'newest_books_cubit_cubit.dart';

@immutable
abstract class NewestBooksCubitState {}

class NewestBooksCubitInitial extends NewestBooksCubitState {}
class NewestBooksCubitLoading extends NewestBooksCubitState {}

class NewestBooksCubitSuccess extends NewestBooksCubitState {
   final List<BookModel> books ;

  NewestBooksCubitSuccess(this.books);
}
class NewestBooksCubitIFaluire extends NewestBooksCubitState {
  final String errorMessage;

  NewestBooksCubitIFaluire(this.errorMessage);
}

