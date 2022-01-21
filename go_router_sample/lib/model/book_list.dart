import 'book.dart';

class BookList{
  final List<Book> books;

  BookList._({required this.books});

  factory BookList(){
    Book book1 = Book(id: 1,title:'吾輩は猫である',author:'夏目漱石');
    Book book2 = Book(id: 2,title:'走れメロス',author:'太宰治');
    Book book3 = Book(id: 3,title:'羅生門',author:'芥川龍之介');
    return BookList._(books: [book1,book2,book3]);
  }

}