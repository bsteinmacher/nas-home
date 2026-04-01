import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../../data/datasources/jellyseerr_datasource.dart';
import '../../data/datasources/music_datasource.dart';
import '../../data/repositories/jellyseerr_repository_impl.dart';
import '../../data/repositories/music_repository_impl.dart';
import '../../data/repositories/nas_repository_impl.dart';
import '../../domain/repositories/jellyseerr_repository.dart';
import '../../domain/repositories/music_repository.dart';
import '../../domain/repositories/nas_repository.dart';
import '../../domain/usecases/get_services_status.dart';
import '../../domain/usecases/get_hardware_info.dart';
import '../../domain/usecases/jellyseerr_usecases.dart';
import '../../domain/usecases/music_usecases.dart';
import '../../presentation/blocs/media_bloc.dart';
import '../../presentation/blocs/music_bloc.dart';
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
  
  sl.registerLazySingleton<JellyseerrDataSource>(() => JellyseerrDataSourceImpl(
        dio: sl(),
        baseUrl: sl<SharedPreferences>().getString('nas_url') ?? '',
        apiKey: sl<SharedPreferences>().getString('jellyseerr_api_key') ?? '',
      ));
  sl.registerLazySingleton<JellyseerrRepository>(
      () => JellyseerrRepositoryImpl(sl()));

  // Lidarr (Music Request Service)
  sl.registerLazySingleton<MusicDataSource>(() => LidarrDataSourceImpl(
        dio: sl(),
        baseUrl: sl<SharedPreferences>().getString('nas_url') ?? '',
        apiKey: sl<SharedPreferences>().getString('lidarr_api_key') ?? '',
      ));
  sl.registerLazySingleton<MusicRepository>(() => MusicRepositoryImpl(sl()));

  //! Domain
  sl.registerLazySingleton(() => GetServicesStatusUseCase(sl()));
  sl.registerLazySingleton(() => GetHardwareInfoUseCase(sl()));
  sl.registerLazySingleton(() => SearchMediaUseCase(sl()));
  sl.registerLazySingleton(() => GetTrendingMediaUseCase(sl()));
  sl.registerLazySingleton(() => RequestMediaUseCase(sl()));
  
  // Music (Lidarr)
  sl.registerLazySingleton(() => SearchArtistsUseCase(sl()));
  sl.registerLazySingleton(() => RequestArtistUseCase(sl()));
  sl.registerLazySingleton(() => GetAlbumsUseCase(sl()));

  //! Presentation
  sl.registerFactory(() => NasStatusBloc(
        getServicesStatus: sl(),
        getHardwareInfo: sl(),
        sharedPreferences: sl(),
      ));
  sl.registerFactory(() => MediaBloc(
        searchMedia: sl(),
        getTrendingMedia: sl(),
        requestMedia: sl(),
      ));
  sl.registerFactory(() => MusicBloc(
        searchArtists: sl(),
        requestArtist: sl(),
        getAlbums: sl(),
      ));
}
