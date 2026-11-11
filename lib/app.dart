import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/di/injection.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/cubits/auth_cubit.dart';
import 'features/auth/presentation/cubits/auth_state.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/dashboard/presentation/pages/dashboard_page.dart';
import 'features/map/presentation/cubits/map_cubit.dart';
import 'features/tracker/presentation/cubits/live_tracking_cubit.dart';
import 'features/tracker/presentation/cubits/tracker_details_cubit.dart';
import 'features/tracker/presentation/cubits/trackers_cubit.dart';
import 'features/trip/presentation/cubits/trip_history_cubit.dart';

class FleetTrackerApp extends StatelessWidget {
  const FleetTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => getIt<AuthCubit>()),
        BlocProvider<TrackersCubit>(create: (_) => getIt<TrackersCubit>()),
        BlocProvider<TrackerDetailsCubit>(
          create: (_) => getIt<TrackerDetailsCubit>(),
        ),
        BlocProvider<LiveTrackingCubit>(
          create: (_) => getIt<LiveTrackingCubit>(),
        ),
        BlocProvider<TripHistoryCubit>(
          create: (_) => getIt<TripHistoryCubit>(),
        ),
        BlocProvider<MapCubit>(create: (_) => getIt<MapCubit>()),
      ],
      child: MaterialApp(
        title: 'SOLIX Tracker System',
        debugShowCheckedModeBanner: false,
        locale: const Locale('ar'),
        supportedLocales: const [Locale('ar')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: AppTheme.light(),
        home: const _AuthGate(),
      ),
    );
  }
}

class _AuthGate extends StatelessWidget {
  const _AuthGate();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          return const DashboardPage();
        }
        return const LoginPage();
      },
    );
  }
}
