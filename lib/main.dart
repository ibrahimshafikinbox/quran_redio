import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio_background/just_audio_background.dart';
 
import 'package:splash/features/splash/view/splash_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.example.quran_app.audio',
    androidNotificationChannelName: 'القرآن الكريم',
    androidNotificationOngoing: true,
    androidStopForegroundOnPause: true,
  );

  await Supabase.initialize(
    url: 'https://owtaqswwgnmbssfowmki.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im93dGFxc3d3Z25tYnNzZm93bWtpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjkzODA4ODksImV4cCI6MjA4NDk1Njg4OX0.Abk21UPfiQweX2-49dy1ks0OysgcfduMNm4asrWN1tI',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '',
          theme: ThemeData(
            fontFamily: 'Cairo',
            scaffoldBackgroundColor: Colors.white,
          ),
          home: SplashScreen(),
        );
      },
    );
    // return MultiRepositoryProvider(
    //   providers: [RepositoryProvider(create: (_) => SurahRepository())],
    //   child: MultiBlocProvider(
    //     providers: [
    //       BlocProvider(
    //         create: (context) => SurahCubit(context.read<SurahRepository>()),
    //       ),
    //       BlocProvider(
    //         create: (_) =>
    //             FatwaListCubit(Supabase.instance.client)..loadFatwas(),
    //       ),
    //       BlocProvider(
    //         create: (_) => AddInquiryCubit(Supabase.instance.client),
    //       ),
    //       BlocProvider(create: (_) => AppVersionCubit(AppVersionRepo())),
    //     ],
    //     child: ScreenUtilInit(
    //       designSize: const Size(360, 690),
    //       minTextAdapt: true,
    //       splitScreenMode: true,
    //       builder: (context, child) {
    //         return MaterialApp(
    //           debugShowCheckedModeBanner: false,
    //           title: '',
    //           theme: ThemeData(
    //             fontFamily: 'Cairo',
    //             scaffoldBackgroundColor: Colors.white,
    //           ),
    //           home: SplashView(),
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}
