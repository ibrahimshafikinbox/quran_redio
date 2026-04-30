import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash/core/colors/app_colors.dart';
import 'package:splash/core/widgets/custom_app_bar.dart';
import 'package:splash/features/about_us/cubit/about_us_cubit.dart';
import 'package:splash/features/about_us/cubit/about_us_state.dart';
import 'package:splash/features/about_us/data/repo/about_us_repository.dart';
import 'widget/about_us_body.dart';
import 'widget/about_us_error_widget.dart';
import 'widget/about_us_shimmer.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AboutUsCubit(AboutUsRepository())..fetchAboutUs(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: CustomAppBar(
            title: "عن التطبيق",
            onBackPressed: () => Navigator.pop(context),
          ),
          body: BlocBuilder<AboutUsCubit, AboutUsState>(
            builder: (context, state) {
              if (state is AboutUsLoading || state is AboutUsInitial) {
                return const AboutUsShimmer();
              }

              if (state is AboutUsError) {
                return AboutUsErrorWidget(message: state.message);
              }

              if (state is AboutUsLoaded) {
                return AboutUsBody(state: state);
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
