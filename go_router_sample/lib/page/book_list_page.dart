import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_sample/model/book.dart';
import 'package:go_router_sample/model/book_list.dart';
import 'package:go_router_sample/model/book_state.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListPage extends ConsumerWidget {
  const BookListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    BookList bookList = BookList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('本のリストページ'),
      ),
      body: ListView.builder(
          itemCount: bookList.books.length,
          itemBuilder: (context, index) {
        Book book = bookList.books[index];
        return ListTile(
          title: Text(book.title),
          onTap: () {
            ref.read(bookStateProvider.state).state = book;
            context.go('/list/detail/${book.id}');
          },
        );
      }),
    );
  }
}
