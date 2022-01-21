import 'package:go_router_sample/model/book.dart';
import 'package:flutter/material.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('本の詳細ページ${book.id}'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Text('タイトル：${book.title}'),
            const SizedBox(
              height: 16,
            ),
            Text('著者：${book.author}'),
          ],
        ));
  }
}
