import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../../data/datasources/seerr_datasource.dart';
import '../../data/datasources/lidarr_datasource.dart';
import '../../data/datasources/registry_datasource.dart';
import '../../data/repositories/seerr_repository_impl.dart';
import '../../data/repositories/lidarr_repository_impl.dart';
import '../../data/repositories/nas_repository_impl.dart';
import '../../data/repositories/registry_repository_impl.dart';
import '../../domain/repositories/seerr_repository.dart';
import '../../domain/repositories/lidarr_repository.dart';
import '../../domain/repositories/nas_repository.dart';
import '../../domain/repositories/registry_repository.dart';
import '../../domain/usecases/get_services_status.dart';
import '../../domain/usecases/get_hardware_info.dart';
import '../../domain/usecases/seerr_usecases.dart';
import '../../domain/usecases/lidarr_usecases.dart';
import '../../domain/usecases/sync_registry_config.dart';
import '../../presentation/blocs/seerr_bloc.dart';
import '../../presentation/blocs/lidarr_bloc.dart';
import '../../presentation/blocs/nas_status_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());

  //! Core

  //! Data
  sl.registerLazySingleton<NasRepository>(() => NasRepositoryImpl(sl()));
  
  sl.registerLazySingleton<RegistryDataSource>(() => RegistryDataSourceImpl(dio: sl()));
  sl.registerLazySingleton<RegistryRepository>(
      () => RegistryRepositoryImpl(dataSource: sl(), sharedPreferences: sl()));

  sl.registerLazySingleton<SeerrDataSource>(() => SeerrDataSourceImpl(
        dio: sl(),
        sharedPreferences: sl(),
      ));
  sl.registerLazySingleton<SeerrRepository>(
      () => SeerrRepositoryImpl(sl()));

  // Lidarr (Music Request Service)
  sl.registerLazySingleton<LidarrDataSource>(() => LidarrDataSourceImpl(
        dio: sl(),
        sharedPreferences: sl(),
      ));
  sl.registerLazySingleton<LidarrRepository>(() => LidarrRepositoryImpl(sl()));

  //! Domain
  sl.registerLazySingleton(() => GetServicesStatusUseCase(sl()));
  sl.registerLazySingleton(() => GetHardwareInfoUseCase(sl()));
  sl.registerLazySingleton(() => SearchSeerrUseCase(sl()));
  sl.registerLazySingleton(() => GetTrendingSeerrUseCase(sl()));
  sl.registerLazySingleton(() => RequestSeerrUseCase(sl()));
  sl.registerLazySingleton(() => SyncRegistryConfigUseCase(sl()));
  
  // Lidarr (Music)
  sl.registerLazySingleton(() => SearchArtistsUseCase(sl()));
  sl.registerLazySingleton(() => RequestArtistUseCase(sl()));
  sl.registerLazySingleton(() => GetAlbumsUseCase(sl()));

  //! Presentation
  sl.registerFactory(() => NasStatusBloc(
        getServicesStatus: sl(),
        getHardwareInfo: sl(),
        sharedPreferences: sl(),
      ));
  sl.registerFactory(() => SeerrBloc(
        searchSeerr: sl(),
        getTrendingSeerr: sl(),
        requestSeerr: sl(),
      ));
  sl.registerFactory(() => LidarrBloc(
        searchArtists: sl(),
        requestArtist: sl(),
        getAlbums: sl(),
      ));
}
