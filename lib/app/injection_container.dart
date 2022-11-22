import 'package:get_it/get_it.dart';
import 'package:wallshop_seller/data/datasource/local_data_source.dart';
import 'package:wallshop_seller/data/repository/data_repository_impl.dart';
import 'package:wallshop_seller/domain/repository/domain_repository.dart';
import 'package:wallshop_seller/domain/usecase/product_terpopuler_usecase/product_terpopuler_usecase.dart';
import 'package:wallshop_seller/domain/usecase/product_usecase/product_usecase.dart';
import 'package:wallshop_seller/presentation/bloc/product-bloc/product_bloc.dart';
import 'package:wallshop_seller/presentation/bloc/product-terpopuler-bloc/product_terpopuler_bloc.dart';

final sl = GetIt.instance;

Future<void> init(String baseUrl) async {
  //Bloc
  sl.registerFactory(() => ProductTerpopulerBloc(sl()));
  sl.registerFactory(() => ProductBloc(sl()));

  //UseCase
  sl.registerLazySingleton(() => ProductTerpopulerUseCase(sl()));
  sl.registerLazySingleton(() => ProductUseCase(sl()));

  //Repository
  sl.registerLazySingleton<DomainRepository>(
      () => DataRepositoryImpl(localDataSource: sl()));

  //DataSources
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
}
