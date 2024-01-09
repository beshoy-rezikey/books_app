// ignore: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/widgets/custom_Loading_indicator.dart';
import '../../../../../core/utils/widgets/customt_errot_widget.dart';
import '../../manager/featured_books_cubit/featured_books_cubit_cubit.dart';
import 'custom_book_item.dart';

class FeatuerdBookListView extends StatelessWidget {
  const FeatuerdBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubitCubit, FeaturedBooksCubitState>(
      builder: (context, state) {
        if (state is FeaturedBooksCubitSuccsess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () =>   GoRouter.of(context).push(AppRouter.kBookDetailesView,extra: state.books[index]),
                  child: CustomBookItem(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail?? 'https://celadonbooks.com/wp-content/uploads/2019/09/memoir-definition.jpg'),
                ),
              ),
            ),
          );
        } else if (state is FeaturedBooksCubitFaluire) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
