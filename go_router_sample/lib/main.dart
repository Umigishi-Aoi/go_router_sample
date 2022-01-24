import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/page/book_detail_page.dart';
import 'package:go_router_sample/page/book_list_page.dart';
import 'package:go_router_sample/page/log_in_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      title: 'Book List Sample',
    );
  }

  //画面の情報を定義する
  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'login',
        path: '/',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const LogInPage(),
        ),
      ),
      GoRoute(
        name: 'list',
        path: '/list',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const BookListPage(),
        ),
        routes: [
          GoRoute(
            name: 'detail',
            path: 'detail/:id',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const BookDetailPage(),
            ),
          ),
        ]
      ),
    ],
    //遷移ページがないなどのエラーが発生した時に、このページに行く
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    ),
  );
}
