import 'package:flutter/cupertino.dart';
import 'package:new_bookly_app/featuers/home/data/models/book_model/book_model.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'custom_book_item.dart';

class BookDetailesSection extends StatelessWidget {
  const BookDetailesSection({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookItem(
              imageUrl: bookModel.volumeInfo.imageLinks?.smallThumbnail ??
                  'https://celadonbooks.com/wp-content/uploads/2019/09/memoir-definition.jpg'),
        ),
        const SizedBox(
          height: 23,
        ),
        Text(
          bookModel.volumeInfo.title!,
          textAlign: TextAlign.center,
          style: Styles.textStyle30,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo.authors?[0] ?? '',
            style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          mainAxisAlignmen: MainAxisAlignment.center,
          count: bookModel.volumeInfo.pageCount ?? 0,
          rating: bookModel.volumeInfo.pageCount ?? 0,
        ),
      ],
    );
  }
}
