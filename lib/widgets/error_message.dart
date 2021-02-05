import 'package:flutter/cupertino.dart';

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage(this.message, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
