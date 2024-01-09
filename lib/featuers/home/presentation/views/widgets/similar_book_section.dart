// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:new_bookly_app/featuers/home/data/models/book_model/book_model.dart';
import 'package:new_bookly_app/featuers/home/presentation/views/widgets/similar_book_list_view.dart';

import '../../../../../core/utils/styles.dart';
import 'book_action.dart';

class SimilarBookSection extends StatelessWidget {
  const SimilarBookSection({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         BookAction(bookmodel: bookModel),
        const SizedBox(
          height: 30,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'You Can Also Like',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const SimilarBookListView(),
      ],
    );
  }
}
