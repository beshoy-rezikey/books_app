import 'package:flutter/material.dart';
import 'package:new_bookly_app/featuers/home/data/models/book_model/book_model.dart';

import '../../../../../core/utils/functions/launch_custom_url.dart';
import '../../../../../core/utils/widgets/custom_button.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookmodel});
  final BookModel bookmodel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Expanded(
              child: CustomButton(
            text: 'Free',
            backGroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12), topLeft: Radius.circular(12)),
          )),
          Expanded(
              child: CustomButton(
            onPressed: () async {
              {
                launchCustomUrl(context, 'bookmodel.volumeInfo.previewLink');
              }
            },
            text: getText(bookmodel),
            backGroundColor: const Color(0xffef8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(12),
                topRight: Radius.circular(12)),
          )),
        ],
      ),
    );
  }

  String getText(BookModel bookmodel) {
    if (bookmodel.volumeInfo.previewLink == null) {
      return 'No Free Preview Aavilable';
    } else {
      return ' Preview ';
    }
  }
}
