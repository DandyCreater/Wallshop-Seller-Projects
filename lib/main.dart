import 'package:flutter/material.dart';
import 'package:wallshop_seller/app/app.dart';
import 'app/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init("");
  runApp(const MyApp());
}
