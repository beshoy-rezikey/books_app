import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../contants.dart';
import '../../../../../core/utils/styles.dart';
import 'newest_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'featuerd_book_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const Padding(padding: hPadding30, child: CutsomAppBar()),
              const FeatuerdBookListView(),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: hPadding30,
                  child: Text(
                    'Newest Books ',
                    style: Styles.textStyle18,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: Padding(
            padding: hPadding30,
            child: NewestBookListview(),
          ),
        ),
      ],
    );
  }
}
