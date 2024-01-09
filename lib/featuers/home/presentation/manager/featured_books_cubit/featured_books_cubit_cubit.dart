
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'featured_books_cubit_state.dart';

class FeaturedBooksCubitCubit extends Cubit<FeaturedBooksCubitState> {
  FeaturedBooksCubitCubit(this.homeRepo) : super(FeaturedBooksCubitInitial());
  final HomeRepo homeRepo;
  Future <void>fetchFeatuerdBooks() async {
    emit(FeaturedBooksCubitInitial());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((faluire) {
      emit(FeaturedBooksCubitFaluire(faluire.errorMessage));
    }, (books) {
      emit(FeaturedBooksCubitSuccsess(books));
    });
  }
}
