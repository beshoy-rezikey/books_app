// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'newest_books_cubit_state.dart';

class NewestBooksCubitCubit extends Cubit<NewestBooksCubitState> {
  NewestBooksCubitCubit(this.homeRepo) : super(NewestBooksCubitInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewestdBooks() async {
    emit(NewestBooksCubitLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold((faluire) {
      emit(NewestBooksCubitIFaluire(faluire.errorMessage));
    }, (books) {
      emit(NewestBooksCubitSuccess(books));
    });
  }
}
