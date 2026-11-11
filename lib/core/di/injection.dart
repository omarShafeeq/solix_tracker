import 'package:get_it/get_it.dart';

import '../../features/auth/presentation/cubits/auth_cubit.dart';
import '../../features/tracker/data/datasources/tracker_remote_datasource.dart';
import '../../features/tracker/domain/repositories/tracker_repository.dart';
import '../../features/tracker/domain/repositories/tracker_repository_impl.dart';
import '../../features/tracker/presentation/cubits/live_tracking_cubit.dart';
import '../../features/tracker/presentation/cubits/tracker_details_cubit.dart';
import '../../features/tracker/presentation/cubits/trackers_cubit.dart';
import '../../features/trip/data/datasources/trip_remote_datasource.dart';
import '../../features/trip/domain/repositories/trip_repository.dart';
import '../../features/trip/domain/repositories/trip_repository_impl.dart';
import '../../features/trip/presentation/cubits/trip_history_cubit.dart';
import '../../features/map/presentation/cubits/map_cubit.dart';
import '../config/app_config.dart';
import '../network/api_client.dart';

final GetIt getIt = GetIt.instance;

void configureDependencies() {
  if (getIt.isRegistered<ApiClient>()) {
    return;
  }

  getIt.registerLazySingleton<ApiClient>(ApiClient.new);
  getIt.registerLazySingleton<TrackerRemoteDataSource>(
    () => TrackerRemoteDataSource(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<TripRemoteDataSource>(
    () => TripRemoteDataSource(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<TrackerRepository>(
    () => TrackerRepositoryImpl(getIt<TrackerRemoteDataSource>()),
  );
  getIt.registerLazySingleton<TripRepository>(
    () => TripRepositoryImpl(getIt<TripRemoteDataSource>()),
  );
  getIt.registerFactory<TrackersCubit>(
    () => TrackersCubit(getIt<TrackerRepository>()),
  );
  getIt.registerFactory<TrackerDetailsCubit>(
    () => TrackerDetailsCubit(getIt<TrackerRepository>()),
  );
  getIt.registerFactory<LiveTrackingCubit>(
    () => LiveTrackingCubit(
      getIt<TrackerRepository>(),
      refreshInterval: Duration(seconds: AppConfig.refreshIntervalSeconds),
      batchSize: AppConfig.stateBatchSize,
    ),
  );
  getIt.registerFactory<TripHistoryCubit>(
    () => TripHistoryCubit(getIt<TripRepository>()),
  );
  getIt.registerFactory<MapCubit>(MapCubit.new);
  getIt.registerLazySingleton<AuthCubit>(AuthCubit.new);
}
