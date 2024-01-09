import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bookly_app/core/utils/widgets/custom_Loading_indicator.dart';
import 'package:new_bookly_app/core/utils/widgets/customt_errot_widget.dart';
import 'package:new_bookly_app/featuers/home/presentation/manager/samilar%20books_cubit/similar_books_cubit.dart';

import 'custom_book_item.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .17,
            child: ListView.builder(
              itemCount:state.books.length ,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: CustomBookItem(
                    imageUrl:state.books[index].volumeInfo.imageLinks?.thumbnail??''),
              ),
            ),
          );
        } else if (state is SimilarBooksError) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
