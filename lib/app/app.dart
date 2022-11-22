import 'package:flutter/material.dart';
import 'package:wallshop_seller/app/injection_container.dart';
import 'package:wallshop_seller/presentation/bloc/product-bloc/product_bloc.dart';
import 'package:wallshop_seller/presentation/bloc/product-terpopuler-bloc/product_terpopuler_bloc.dart';
import 'package:wallshop_seller/presentation/screen/homepage/homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final productPopulerBloc = sl<ProductTerpopulerBloc>()
      ..add(FetchProductPopuler());
    final productBloc = sl<ProductBloc>()..add(FetchProduct());
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => productPopulerBloc),
        BlocProvider(create: (_) => productBloc)
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePageScreen(),
      ),
    );
  }
}
