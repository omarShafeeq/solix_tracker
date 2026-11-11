import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../map/presentation/cubits/map_cubit.dart';
import '../../../map/presentation/widgets/map_area.dart';
import '../../../tracker/presentation/cubits/live_tracking_cubit.dart';
import '../../../tracker/presentation/cubits/live_tracking_state.dart';
import '../../../tracker/presentation/cubits/tracker_details_cubit.dart';
import '../../../tracker/presentation/cubits/trackers_cubit.dart';
import '../../../tracker/presentation/cubits/trackers_state.dart';
import '../../../tracker/presentation/widgets/tracker_details_panel.dart';
import '../../../tracker/presentation/widgets/tracker_list_panel.dart';
import '../../../trip/presentation/cubits/trip_history_cubit.dart';
import '../../../trip/presentation/cubits/trip_history_state.dart';
import '../../../trip/presentation/trip_bounds.dart';
import '../../../trip/presentation/widgets/trip_history_panel.dart';
import '../widgets/brand_sidebar.dart';
import '../widgets/responsive_layout.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with WidgetsBindingObserver {
  bool _listOpen = true;
  bool _detailsOpen = false;
  bool _bootstrapped = false;
  int _tripExpandRequest = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => _bootstrap());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> _bootstrap() async {
    if (_bootstrapped || !mounted) {
      return;
    }
    _bootstrapped = true;
    final now = DateTime.now();
    context.read<TripHistoryCubit>().setDateRange(
      from: now.subtract(const Duration(hours: 24)),
      to: now,
    );
    await context.read<TrackersCubit>().loadTrackers();
    if (!mounted) {
      return;
    }
    final trackers = context.read<TrackersCubit>().state;
    context.read<LiveTrackingCubit>().startTracking(
      trackers.trackers.map((tracker) => tracker.id).whereType<int>().toList(),
    );
    context.read<MapCubit>().syncVisibleIds(trackers.mapTrackerIds);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!mounted) {
      return;
    }
    final live = context.read<LiveTrackingCubit>();
    // `inactive` also fires for short focus changes such as dialogs, so polling
    // pauses only when the tab or window is actually in the background.
    if (state == AppLifecycleState.resumed) {
      final ids = context
          .read<TrackersCubit>()
          .state
          .trackers
          .map((tracker) => tracker.id)
          .whereType<int>()
          .toList();
      if (ids.isNotEmpty) {
        live.startTracking(ids);
      }
    } else if (state == AppLifecycleState.hidden ||
        state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      live.stopTracking();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<TrackersCubit, TrackersState>(
            listenWhen: (previous, current) =>
                previous.selectedTrackerId != current.selectedTrackerId,
            listener: (context, state) {
              final id = state.selectedTrackerId;
              context.read<MapCubit>().syncSelection(id);
              context.read<TripHistoryCubit>().setTracker(id);
              if (id == null) {
                context.read<TrackerDetailsCubit>().clear();
                setState(() => _detailsOpen = false);
                return;
              }
              setState(() => _detailsOpen = true);
              context.read<TrackerDetailsCubit>().loadDetails(id);
              context.read<MapCubit>().focusOnTracker(id);
              if (breakpointFor(MediaQuery.sizeOf(context).width) ==
                  DashboardBreakpoint.mobile) {
                _showDetailsSheet();
              }
            },
          ),
          BlocListener<TrackersCubit, TrackersState>(
            listenWhen: (previous, current) =>
                previous.visibleTrackerIds != current.visibleTrackerIds ||
                previous.filteredTrackers != current.filteredTrackers,
            listener: (context, state) {
              context.read<MapCubit>().syncVisibleIds(state.mapTrackerIds);
            },
          ),
          BlocListener<TrackersCubit, TrackersState>(
            listenWhen: (previous, current) =>
                previous.trackers != current.trackers,
            listener: (context, state) {
              context.read<LiveTrackingCubit>().updateTrackerIds(
                state.trackers
                    .map((tracker) => tracker.id)
                    .whereType<int>()
                    .toList(),
              );
            },
          ),
          BlocListener<LiveTrackingCubit, LiveTrackingState>(
            listenWhen: (previous, current) =>
                previous.states != current.states,
            listener: (context, state) {
              context.read<TrackersCubit>().syncLiveStates(state.states);
            },
          ),
          BlocListener<TripHistoryCubit, TripHistoryState>(
            listenWhen: (previous, current) =>
                previous.selectedTripIndex != current.selectedTripIndex,
            listener: (context, state) {
              final trip = state.selectedTrip;
              if (trip == null) {
                return;
              }
              final bounds = boundsForTrip(trip);
              if (bounds == null || !bounds.isValid) {
                return;
              }
              context.read<MapCubit>().fitToBounds(
                north: bounds.north,
                south: bounds.south,
                east: bounds.east,
                west: bounds.west,
              );
            },
          ),
        ],
        child: LayoutBuilder(
          builder: (context, constraints) {
            final breakpoint = breakpointFor(constraints.maxWidth);
            return Column(
              children: [
                const BrandHeader(),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (breakpoint != DashboardBreakpoint.mobile)
                        BrandSidebar(
                          listOpen: _listOpen,
                          detailsOpen: _detailsOpen,
                          onToggleList: () =>
                              setState(() => _listOpen = !_listOpen),
                          onToggleDetails: () =>
                              setState(() => _detailsOpen = !_detailsOpen),
                          onOpenTrips: _openTrips,
                        ),
                      Expanded(
                        child: DashboardLayout(
                          breakpoint: breakpoint,
                          showList: _listOpen,
                          showDetails: _detailsOpen,
                          onOpenList: () => _openSheet(
                            TrackerListPanel(
                              onCollapse: () =>
                                  Navigator.of(context).maybePop(),
                              onRevealDetails: _revealDetails,
                            ),
                          ),
                          onOpenDetails: () => _openSheet(
                            TrackerDetailsPanel(
                              onCollapse: () =>
                                  Navigator.of(context).maybePop(),
                            ),
                          ),
                          onOpenTrips: _openTrips,
                          list: TrackerListPanel(
                            onCollapse: () => setState(() => _listOpen = false),
                            onRevealDetails: _revealDetails,
                          ),
                          details: TrackerDetailsPanel(
                            onCollapse: () =>
                                setState(() => _detailsOpen = false),
                          ),
                          map: _MapStage(
                            showTripPanel:
                                breakpoint != DashboardBreakpoint.mobile,
                            expandRequest: _tripExpandRequest,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _openTrips() {
    if (breakpointFor(MediaQuery.sizeOf(context).width) ==
        DashboardBreakpoint.mobile) {
      _openSheet(const TripHistoryPanel(forceExpanded: true));
      return;
    }
    setState(() => _tripExpandRequest++);
  }

  void _revealDetails() {
    setState(() => _detailsOpen = true);
    if (breakpointFor(MediaQuery.sizeOf(context).width) ==
        DashboardBreakpoint.mobile) {
      _showDetailsSheet();
    }
  }

  void _showDetailsSheet() {
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _openSheet(
        TrackerDetailsPanel(onCollapse: () => Navigator.of(context).maybePop()),
      );
    });
  }

  void _openSheet(Widget child) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
      ),
      builder: (context) {
        final height = MediaQuery.sizeOf(context).height * 0.82;
        return SizedBox(height: height, child: child);
      },
    );
  }
}

class _MapStage extends StatelessWidget {
  const _MapStage({required this.showTripPanel, required this.expandRequest});

  final bool showTripPanel;
  final int expandRequest;

  @override
  Widget build(BuildContext context) {
    if (!showTripPanel) {
      return const MapArea();
    }
    return Stack(
      children: [
        const MapArea(),
        Align(
          alignment: Alignment.bottomCenter,
          child: TripHistoryPanel(expandRequest: expandRequest),
        ),
      ],
    );
  }
}
