import 'package:go_router/go_router.dart';
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
            //画面遷移のコード
            context.goNamed('list');
            //こちらでも可
            // context.go('/list');
          },
        ),
      ),
    );
  }
}
