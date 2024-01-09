// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_bookly_app/featuers/home/data/repos/home_repo.dart';

import '../../../data/models/book_model/book_model.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSamilarBooks(catergory: category);
    result.fold((faluire) {
      emit(SimilarBooksError(faluire.errorMessage));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
