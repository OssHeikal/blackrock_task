import 'package:get_it/get_it.dart';

import '../data/datasource/datasource.dart';
import '../data/repository/repository.dart';
import '../presentation/controller/cubit/home_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static Future<void> setup() async {
    sl.registerLazySingleton<Repository>(() => RepositoryImpl(sl()));
    sl.registerLazySingleton<DataSource>(() => DataSourceImpl());

    // cubit 
    sl.registerFactory<HomeCubit>(() => HomeCubit(sl()));
  }
}
