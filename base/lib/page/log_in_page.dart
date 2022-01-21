import 'package:base/page/book_list_page.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログインページ'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('ログイン'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookListPage()),
            );
          },
        ),
      ),
    );
  }
}
