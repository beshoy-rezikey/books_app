import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'contants.dart';
import 'package:flutter/material.dart';

import 'core/utils/app_router.dart';
import 'core/utils/locater_service.dart';
import 'featuers/home/data/repos/home_repo_imp.dart';
import 'featuers/home/presentation/manager/featured_books_cubit/featured_books_cubit_cubit.dart';
import 'featuers/home/presentation/manager/newest_books_cubit/newest_books_cubit_cubit.dart';

void main() {
  runApp(const new_bookly_app());
  setupServiceLocator();
}

// ignore: camel_case_types
class new_bookly_app extends StatelessWidget {
  const new_bookly_app({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubitCubit(getIt.get<HomeRepoImplmentation>())
                ..fetchFeatuerdBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubitCubit(getIt.get<HomeRepoImplmentation>())
                ..fetchNewestdBooks(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
