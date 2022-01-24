import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:go_router_sample/model/book.dart';
import 'package:go_router_sample/model/book_state.dart';

class BookDetailPage extends ConsumerWidget {

  const BookDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    Book book = ref.watch(bookStateProvider);
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
