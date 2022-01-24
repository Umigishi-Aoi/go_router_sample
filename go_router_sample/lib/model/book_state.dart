import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_sample/model/book.dart';

final bookStateProvider =
    StateProvider<Book>((ref) => Book(id: 0, title: '', author: ''));
