import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/debouncer.dart';
import '../cubits/trackers_cubit.dart';

class TrackerSearchBar extends StatefulWidget {
  const TrackerSearchBar({super.key});

  @override
  State<TrackerSearchBar> createState() => _TrackerSearchBarState();
}

class _TrackerSearchBarState extends State<TrackerSearchBar> {
  final TextEditingController _controller = TextEditingController();
  late final Debouncer _debouncer = Debouncer(
    duration: AppConstants.searchDebounce,
  );

  @override
  void dispose() {
    _debouncer.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('tracker_search_field'),
      controller: _controller,
      onChanged: (value) {
        setState(() {});
        _debouncer.run(() {
          if (!mounted) {
            return;
          }
          context.read<TrackersCubit>().search(value);
        });
      },
      decoration: InputDecoration(
        hintText: 'ابحث بالاسم أو المعرف',
        prefixIcon: const Icon(Icons.search, size: 20, color: AppColors.accent),
        suffixIcon: _controller.text.isEmpty
            ? null
            : IconButton(
                tooltip: 'مسح البحث',
                onPressed: () {
                  _controller.clear();
                  context.read<TrackersCubit>().search('');
                  setState(() {});
                },
                icon: const Icon(Icons.close, size: 18),
              ),
      ),
    );
  }
}
