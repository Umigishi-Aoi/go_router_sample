import 'package:go_router_sample/model/book.dart';
import 'package:go_router_sample/model/book_list.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                context.go('/list/detail/${book.id}');
                //こちらでも良い
                // context.goNamed('detail',params: {'id' : book.id.toString()});
              },
            );
          }),
    );
  }
}
