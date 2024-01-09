import 'package:flutter/material.dart';
import 'package:new_bookly_app/featuers/home/data/models/book_model/book_model.dart';
import 'package:new_bookly_app/featuers/home/presentation/views/widgets/similar_book_section.dart';

import 'book_detailes_app_bar.dart';
import 'book_detailes_section.dart';

class BookDetaielsViewBody extends StatelessWidget {
  const BookDetaielsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                const CustomBookDeatilesApppBar(),
                 BookDetailesSection(bookModel: bookModel),
                const Expanded(
                  child: SizedBox(
                    height: 25,
                  ),
                ),
                SimilarBookSection(bookModel: bookModel),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
