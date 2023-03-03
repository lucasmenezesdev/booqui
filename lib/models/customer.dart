import 'package:booqui/models/book.dart';

class Customer {
  late final String _id;
  late String _name = '';
  late String _lastName = '';
  late String _email = '';
  late final bool _isSignature;
  late final List<Book> _books;

  Customer._();
  static final _instance = Customer._();

  static get() {
    return _instance;
  }

  String getName() {
    return _name;
  }

  String getLastName() {
    return _lastName;
  }

  String getEmail() {
    return _email;
  }

  Future fromJson(Map<String, dynamic> json) async {
    _name = json['name'];
    _lastName = json['lastName'];
    _email = json['email'];
  }

  void printCustomer() {
    print(_name);
    print(_lastName);
    print(_email);
  }
}
