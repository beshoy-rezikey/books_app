import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Faluire, List<BookModel>>> fetchNewestBooks();
  Future<Either<Faluire, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Faluire, List<BookModel>>> fetchSamilarBooks(
      {required String catergory});
}
