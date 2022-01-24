import 'package:go_router/go_router.dart';
import 'package:go_router_sample/model/book_list.dart';
import 'package:go_router_sample/page/book_detail_page.dart';
import 'package:go_router_sample/page/book_list_page.dart';
import 'package:go_router_sample/page/log_in_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/book.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<BookList>(
      create: (context) => BookList(),
      child: MaterialApp.router(
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        title: 'Book List Sample',
      ),
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
                pageBuilder: (context, state) {
                  Book? book = Provider.of<BookList>(context)
                      .bookFromId(state.params['id']!);
                  //エラーページへ遷移
                  if (book == null) {
                    return MaterialPage(
                      key: state.pageKey,
                      child: Scaffold(
                          appBar: AppBar(
                            title: const Text('ページが存在しません'),
                          ),
                          body: Container()),
                    );
                  }
                  return MaterialPage(
                    key: state.pageKey,
                    child: BookDetailPage(
                      book: book,
                    ),
                  );
                }),
          ]),
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
