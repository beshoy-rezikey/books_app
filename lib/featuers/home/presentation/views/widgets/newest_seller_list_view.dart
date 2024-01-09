import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bookly_app/core/utils/widgets/custom_Loading_indicator.dart';
import 'package:new_bookly_app/core/utils/widgets/customt_errot_widget.dart';
import 'package:new_bookly_app/featuers/home/presentation/manager/newest_books_cubit/newest_books_cubit_cubit.dart';

import 'book_view_item.dart';

class NewestBookListview extends StatelessWidget {
  const NewestBookListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubitCubit, NewestBooksCubitState>(
      builder: (context, state) {
        if (state is NewestBooksCubitSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BookViewItem(
                    bookModel: state.books[index],
                  ));
            },
          );
        } else if (state is NewestBooksCubitIFaluire) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
