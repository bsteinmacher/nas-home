import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../storage/secure_storage_service.dart';
import '../../data/datasources/seerr_datasource.dart';
import '../../data/datasources/lidarr_datasource.dart';
import '../../data/datasources/radarr_datasource.dart';
import '../../data/datasources/sonarr_datasource.dart';
import '../../data/datasources/prowlarr_datasource.dart';
import '../../data/datasources/registry_datasource.dart';
import '../../data/repositories/seerr_repository_impl.dart';
import '../../data/repositories/lidarr_repository_impl.dart';
import '../../data/repositories/radarr_repository_impl.dart';
import '../../data/repositories/sonarr_repository_impl.dart';
import '../../data/repositories/prowlarr_repository_impl.dart';
import '../../data/repositories/nas_repository_impl.dart';
import '../../data/repositories/registry_repository_impl.dart';
import '../../domain/repositories/seerr_repository.dart';
import '../../domain/repositories/lidarr_repository.dart';
import '../../domain/repositories/radarr_repository.dart';
import '../../domain/repositories/sonarr_repository.dart';
import '../../domain/repositories/prowlarr_repository.dart';
import '../../domain/repositories/nas_repository.dart';
import '../../domain/repositories/registry_repository.dart';
import '../../domain/usecases/get_services_status.dart';
import '../../domain/usecases/get_hardware_info.dart';
import '../../domain/usecases/seerr_usecases.dart';
import '../../domain/usecases/lidarr_usecases.dart';
import '../../domain/usecases/radarr_usecases.dart';
import '../../domain/usecases/sonarr_usecases.dart';
import '../../domain/usecases/prowlarr_usecases.dart';
import '../../domain/usecases/sync_registry_config.dart';
import '../../presentation/blocs/seerr_bloc.dart';
import '../../presentation/blocs/lidarr_bloc.dart';
import '../../presentation/blocs/radarr_bloc.dart';
import '../../presentation/blocs/sonarr_bloc.dart';
import '../../presentation/blocs/prowlarr_bloc.dart';
import '../../presentation/blocs/nas_status_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());

  //! Core
  sl.registerLazySingleton<SecureStorageService>(() => SecureStorageServiceImpl());

  //! Data
  sl.registerLazySingleton<NasRepository>(() => NasRepositoryImpl(sl()));
  
  sl.registerLazySingleton<RegistryDataSource>(() => RegistryDataSourceImpl(dio: sl()));
  sl.registerLazySingleton<RegistryRepository>(() => RegistryRepositoryImpl(
        dataSource: sl(),
        sharedPreferences: sl(),
        secureStorage: sl(),
      ));

  sl.registerLazySingleton<SeerrDataSource>(() => SeerrDataSourceImpl(
        dio: sl(),
        sharedPreferences: sl(),
        secureStorage: sl(),
      ));
  sl.registerLazySingleton<SeerrRepository>(() => SeerrRepositoryImpl(sl()));

  // Lidarr (Music Request Service)
  sl.registerLazySingleton<LidarrDataSource>(() => LidarrDataSourceImpl(
        dio: sl(),
        sharedPreferences: sl(),
        secureStorage: sl(),
      ));
  sl.registerLazySingleton<LidarrRepository>(() => LidarrRepositoryImpl(sl()));

  // Radarr (Movies)
  sl.registerLazySingleton<RadarrDataSource>(() => RadarrDataSourceImpl(
        dio: sl(),
        sharedPreferences: sl(),
        secureStorage: sl(),
      ));
  sl.registerLazySingleton<RadarrRepository>(() => RadarrRepositoryImpl(sl()));

  // Sonarr (TV Shows)
  sl.registerLazySingleton<SonarrDataSource>(() => SonarrDataSourceImpl(
        dio: sl(),
        sharedPreferences: sl(),
        secureStorage: sl(),
      ));
  sl.registerLazySingleton<SonarrRepository>(() => SonarrRepositoryImpl(sl()));

  // Prowlarr (Indexers)
  sl.registerLazySingleton<ProwlarrDataSource>(() => ProwlarrDataSourceImpl(
        dio: sl(),
        sharedPreferences: sl(),
        secureStorage: sl(),
      ));
  sl.registerLazySingleton<ProwlarrRepository>(() => ProwlarrRepositoryImpl(dataSource: sl()));

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

  // Radarr (Movies)
  sl.registerLazySingleton(() => GetRadarrMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetRadarrQueueUseCase(sl()));

  // Sonarr (TV)
  sl.registerLazySingleton(() => GetSonarrSeriesUseCase(sl()));
  sl.registerLazySingleton(() => GetSonarrQueueUseCase(sl()));

  // Prowlarr (Indexers)
  sl.registerLazySingleton(() => GetProwlarrIndexersUseCase(sl()));

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
  sl.registerFactory(() => RadarrBloc(
        getMovies: sl(),
        getQueue: sl(),
      ));
  sl.registerFactory(() => SonarrBloc(
        getSeries: sl(),
        getQueue: sl(),
      ));
  sl.registerFactory(() => ProwlarrBloc(
        getIndexers: sl(),
      ));
}
