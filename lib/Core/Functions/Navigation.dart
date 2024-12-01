import 'package:flutter/material.dart';

push(BuildContext context, Widget veiw) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => veiw));
}

pushReplacement(BuildContext context, Widget veiw) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => veiw));
}

pushAndRemoveUntill(BuildContext context, Widget view) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => view), (route) => false);
}
