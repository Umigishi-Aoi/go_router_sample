import 'package:base/model/book.dart';
import 'package:base/model/book_list.dart';
import 'package:base/page/book_detail_page.dart';
import 'package:flutter/material.dart';

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
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BookDetailPage(book: book)),
            );
          },
        );
      }),
    );
  }
}
