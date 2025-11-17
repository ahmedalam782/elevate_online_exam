import 'package:elevate_online_exam/core/theme/app_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/config/base_state/base_state.dart';
import '../../../../../core/errors/handle_errors/handle_errors.dart';
import '../../../../../core/shared/widgets/error_page.dart';
import '../../view_model/cubit/explore_cubit.dart';
import '../../view_model/cubit/explore_event.dart';
import '../../view_model/cubit/explore_states.dart';
import 'shimmer_build_items.dart';
import 'subject_empty_item_list.dart';
import 'subject_item.dart';

class SubjectBuildItems extends StatelessWidget {
  const SubjectBuildItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        final exploreCubit = context.read<ExploreCubit>();
        final networkCheck = handleNetwork(state.getAllSubjects?.exception);
        final isMoreLoading =
            state.getAllSubjects?.state == StateType.moreLoading;
        if (networkCheck == false &&
            state.getAllSubjects?.state == StateType.error) {
          return Expanded(
            child: ErrorPage(
              isConnectionerror: networkCheck,
              onRefresh: () async {
                exploreCubit.doAction(GetAllSubjectsEvent());
              },
            ),
          );
        } else if (state.getAllSubjects?.state == StateType.loading) {
          // Shimmer loading effect
          return ShimmerBuildItems();
        }
        // Filter subjects by name
        return Expanded(
          child: Column(
            children: [
              exploreCubit.filteredSubjects.isEmpty
                  ? Expanded(
                      child: SubjectEmptyItemList(
                        onPressed: () =>
                            exploreCubit.doAction(GetAllSubjectsEvent()),
                      ),
                    )
                  : Expanded(
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          if (notification.metrics.pixels ==
                                  notification.metrics.maxScrollExtent &&
                              notification is ScrollUpdateNotification &&
                              exploreCubit.isMoreLoading) {
                            exploreCubit.doAction(
                              GetAllSubjectsEvent(isRefresh: true),
                            );
                          }
                          return true;
                        },
                        child: RefreshIndicator(
                          onRefresh: () =>
                              exploreCubit.doAction(GetAllSubjectsEvent()),
                          child: ListView.separated(
                            padding: EdgeInsets.only(bottom: 16.0),
                            itemCount:
                                exploreCubit.filteredSubjects.length +
                                (isMoreLoading ? 1 : 0),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              final isLoaderRow =
                                  isMoreLoading &&
                                  index == exploreCubit.filteredSubjects.length;
                              if (isLoaderRow) {
                                return Center(
                                  child: Lottie.asset(
                                    AppAnimations
                                        .animationsLoadingAnimationBlue,
                                    width: 100,
                                    height: 100,
                                  ),
                                );
                              }
                              return SubjectItem(
                                subject: exploreCubit.filteredSubjects[index],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
