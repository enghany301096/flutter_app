import 'package:flutter/cupertino.dart';

class MySizedBox extends StatelessWidget {
  final double byHeight;

  const MySizedBox({this.byHeight});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: byHeight,
    );
  }
}
