import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:new_bookly_app/core/utils/locater_service.dart';
import 'package:new_bookly_app/featuers/home/data/models/book_model/book_model.dart';
import 'package:new_bookly_app/featuers/home/data/repos/home_repo_imp.dart';
import 'package:new_bookly_app/featuers/home/presentation/manager/samilar%20books_cubit/similar_books_cubit.dart';

import '../../featuers/home/presentation/views/book_detailes_view.dart';
import '../../featuers/home/presentation/views/home_view.dart';
import '../../featuers/splash/presentation/views/spalsh_view.dart';

abstract class AppRouter {
  static const kHomeView = '/kHomeView';
  static const kBookDetailesView = '/kBookDetailesView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kBookDetailesView,
        builder: (BuildContext context, GoRouterState state) {
          return  BlocProvider(
            create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImplmentation>()),
            child:  BookDeatailesView(bookmodel: state.extra as BookModel ),
          );
        },
      ),

    ],
  );
}
