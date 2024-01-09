import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bookly_app/featuers/home/data/models/book_model/book_model.dart';
import 'package:new_bookly_app/featuers/home/presentation/manager/samilar%20books_cubit/similar_books_cubit.dart';
import 'package:new_bookly_app/featuers/home/presentation/views/widgets/book_detailes_view_body.dart';

class BookDeatailesView extends StatefulWidget {
  const BookDeatailesView({super.key, required this.bookmodel});
  final BookModel bookmodel ;

  @override
  State<BookDeatailesView> createState() => _BookDeatailesViewState();
}

class _BookDeatailesViewState extends State<BookDeatailesView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
      category: widget.bookmodel.volumeInfo.categories![0]
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: BookDetaielsViewBody(bookModel: widget.bookmodel,)),
    );
  }
}
