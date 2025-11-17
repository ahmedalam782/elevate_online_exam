import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/di/injectable_config.dart';
import '../../../../../core/errors/handle_errors/handle_errors.dart';
import '../../../../../core/languages/locale_keys.g.dart';
import '../../../../../core/shared/widgets/no_internet_widget.dart';
import '../../../../../core/shared/widgets/search_widget.dart';
import '../../../../../core/theme/styles.dart';
import '../../view_model/cubit/explore_cubit.dart';
import '../../view_model/cubit/explore_event.dart';
import '../../view_model/cubit/explore_states.dart';
import '../widgets/subject_build_items.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});
  final ExploreCubit _exploreCubit = getIt.get<ExploreCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _exploreCubit..doAction(GetAllSubjectsEvent()),
      child: BlocBuilder<ExploreCubit, ExploreState>(
        builder: (context, state) {
          final networkCheck = handleNetwork(state.getAllSubjects?.exception);
          if ((networkCheck == true)) {
            return NoInternetWidget(
              onPressed: () async {
                _exploreCubit.doAction(GetAllSubjectsEvent());
              },
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchWidget(
                    title: '',
                    onSearchChanged: (value) {
                      _exploreCubit.doAction(GetAllSubjectsEvent(
                        searchText: value,
                      ));
                    },
                    searchController: _exploreCubit.searchController,
                  ),
                  SizedBox(height: 20),
                  Text(
                    LocaleKeys.subjects_browse_by_subject.tr(),
                    style: Styles.medium(context, 18),
                  ),
                  SizedBox(height: 12),
                  SubjectBuildItems(),
                  SizedBox(height: 16),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
