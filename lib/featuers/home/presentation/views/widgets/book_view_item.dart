import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_bookly_app/featuers/home/data/models/book_model/book_model.dart';
import 'package:new_bookly_app/featuers/home/presentation/views/widgets/custom_book_item.dart';

import '../../../../../contants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BookViewItem extends StatelessWidget {
   BookViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  List <String> unknown= ['unknown'];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kBookDetailesView, extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            AspectRatio(
                aspectRatio: 2.6 / 4,
                child: CustomBookItem(
                    imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??
                        'https://celadonbooks.com/wp-content/uploads/2019/09/memoir-definition.jpg')),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      bookModel.volumeInfo.title!,
                      style: Styles.textStyle20
                          .copyWith(fontFamily: kGtSectraFine),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    bookModel.volumeInfo.authors?[0] ?? '',
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Free',
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold)),
                      const Spacer(),
                      BookRating(
                        count: bookModel.volumeInfo.pageCount ?? 0,
                        rating: bookModel.volumeInfo.pageCount ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
